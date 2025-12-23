import 'package:alphareality/landing_pages/signup.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const BookingApp());
}

class BookingApp extends StatelessWidget {
  const BookingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AlphaLoginScreen(),
    );
  }
}

/// CUSTOM FORMATTER — BLOCKS INVALID FIRST DIGITS (0–4)
class MobileFirstDigitFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) return newValue;

    // First digit must be 5–9
    if (newValue.text.length == 1) {
      if (!RegExp(r'^[5-9]$').hasMatch(newValue.text)) {
        return oldValue; // ❌ Block typing
      }
    }

    return newValue;
  }
}

class AlphaLoginScreen extends StatefulWidget {
  const AlphaLoginScreen({super.key});

  @override
  State<AlphaLoginScreen> createState() => _AlphaLoginScreenState();
}

class _AlphaLoginScreenState extends State<AlphaLoginScreen> {
  final TextEditingController aadharController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();

  String? aadharError;
  String? mobileError;

  void validateAadhar(String value) {
    if (value.isEmpty) {
      aadharError = "Enter Aadhaar number";
    } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      aadharError = "Only numbers allowed";
    } else if (value.length != 12) {
      aadharError = "Aadhaar must be 12 digits";
    } else {
      aadharError = null;
    }
  }

  void validateMobile(String value) {
    if (value.isEmpty) {
      mobileError = "Enter Mobile number";
    } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      mobileError = "Only numbers allowed";
    } else if (value.length != 10) {
      mobileError = "Mobile must be 10 digits";
    } else if (!RegExp(r'^[5-9]').hasMatch(value)) {
      mobileError = "Mobile number must start with 5, 6, 7, 8 or 9";
    } else {
      mobileError = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
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
            child: Align(
              alignment: Alignment.topCenter,

              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),

                  child: Column(
                    children: [
                      const SizedBox(height: 70),

                      /// LOGO
                      Image.asset(
                        'assets/logo.png',
                        height: 98,
                        width: 270,
                      ),

                      const SizedBox(height: 20),

                      /// LOCK
                      Opacity(
                        opacity: 0.95,
                        child: Image.asset(
                          'assets/lock.png',
                          height: 154,
                          width: 153,
                        ),
                      ),

                      const SizedBox(height: 20),

                      /// TITLE
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "Your journey starts with logging in",
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      /// AADHAAR FIELD
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: aadharController,
                          textAlign: TextAlign.center,
                          maxLength: 12,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(12),
                          ],
                          onChanged: (value) {
                            setState(() => validateAadhar(value));
                          },
                          decoration: const InputDecoration(
                            counterText: "",
                            hintText: "Aadhar Number",
                            border: InputBorder.none,
                            hintStyle: TextStyle(fontWeight: FontWeight.w500),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 8,
                            ),
                          ),
                        ),
                      ),

                      if (aadharError != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Text(
                            aadharError!,
                            style: const TextStyle(color: Colors.red, fontSize: 12),
                          ),
                        ),

                      const SizedBox(height: 6),

                      /// UNDERLINED OR
                      const Text(
                        "Or",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      const SizedBox(height: 6),

                      /// MOBILE FIELD
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: mobileController,
                          textAlign: TextAlign.center,
                          maxLength: 10,
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            MobileFirstDigitFormatter(), // 🔥 BLOCKS 0–4
                            LengthLimitingTextInputFormatter(10),
                          ],
                          onChanged: (value) {
                            setState(() => validateMobile(value));
                          },
                          decoration: const InputDecoration(
                            counterText: "",
                            hintText: "Mobile Number",
                            border: InputBorder.none,
                            hintStyle: TextStyle(fontWeight: FontWeight.w500),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 8,
                            ),
                          ),
                        ),
                      ),

                      if (mobileError != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Text(
                            mobileError!,
                            style: const TextStyle(color: Colors.red, fontSize: 12),
                          ),
                        ),

                      const SizedBox(height: 20),

                      /// SIGNUP TEXT
                      RichText(
                        text: TextSpan(
                          text: "Don't have an account ? ",
                          style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                          children: [
                            TextSpan(
                              text: "Sign in",
                              style: const TextStyle(
                                color: Color.fromRGBO(0, 118, 229, 1),
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const AlphaSignupScreen(),
                                    ),
                                  );
                                },
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
