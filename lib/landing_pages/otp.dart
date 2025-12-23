import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final List<TextEditingController> _controllers =
      List.generate(4, (index) => TextEditingController());

  int _remainingSeconds = 30;
  Timer? _timer;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _canResend = false;
    _remainingSeconds = 30;

    // 🔥 FIX: Update UI immediately so timer shows 30 sec instantly
    setState(() {});

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds == 0) {
        setState(() {
          _canResend = true;
        });
        timer.cancel();
      } else {
        setState(() {
          _remainingSeconds--;
        });
      }
    });
  }

  @override
  void dispose() {
    for (var c in _controllers) {
      c.dispose();
    }
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isOtpFilled = _controllers.every((c) => c.text.trim().isNotEmpty);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Opacity(
              opacity: 0.8,
              child: Image.asset(
                'assets/BG.png',
                width: MediaQuery.of(context).size.width,
                height: 550,
                fit: BoxFit.cover,
              ),
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Container(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 70),

                    Image.asset(
                      'assets/logo.png',
                      height: 98,
                      width: 270,
                    ),

                    const SizedBox(height: 20),

                    Image.asset(
                      'assets/otp.png',
                      height: 140,
                      width: 130,
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      "We’ll send you a one-time password (OTP) to",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Text(
                      "securely verify your identity",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(4, (index) {
                        return SizedBox(
                          height: 55,
                          width: 55,
                          child: TextField(
                            controller: _controllers[index],
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            maxLength: 1,
                            decoration: InputDecoration(
                              counterText: "",
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide:
                                    BorderSide(color: Colors.grey.shade400),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Colors.blue, width: 1),
                              ),
                            ),
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            onChanged: (value) {
                              setState(() {});
                              if (value.isNotEmpty && index < 3) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                          ),
                        );
                      }),
                    ),

                    const SizedBox(height: 20),

                    /// ROW 1 — Remaining Time
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Remaining time: ",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "00:${_remainingSeconds.toString().padLeft(2, '0')}s",
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromRGBO(33, 85, 138, 1),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    /// ROW 2 — Resend
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Didn't get the code? ",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),

                        GestureDetector(
                          onTap: _canResend
                              ? () {
                                  startTimer();
                                }
                              : null,
                          child: Text(
                            "Resend",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: _canResend ? const Color.fromRGBO(33, 85, 138, 1) : Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    GestureDetector(
                      onTap: isOtpFilled ? () {} : null,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        height: 55,
                        width: 55,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: isOtpFilled
                                ? const [
                                    Color(0xFF374198),
                                    Color(0xFF050735),
                                  ]
                                : const [
                                    Color.fromRGBO(55, 65, 152, 0.5),
                                    Color.fromRGBO(5, 7, 53, 0.5),
                                  ],
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(58, 41, 106, 0.2),
                              offset: Offset(0, 3),
                              blurRadius: 3,
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white.withOpacity(isOtpFilled ? 1 : 0.4),
                          size: 28,
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
