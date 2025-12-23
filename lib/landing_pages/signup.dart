import 'package:alphareality/landing_pages/login.dart';
import 'package:alphareality/landing_pages/otp.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AlphaSignupScreen extends StatefulWidget {
  const AlphaSignupScreen({super.key});

  @override
  State<AlphaSignupScreen> createState() => _AlphaSignupScreenState();
}

class _AlphaSignupScreenState extends State<AlphaSignupScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  String? nameError;
  String? numberError;

  bool get isValidForm =>
      nameError == null &&
      numberError == null &&
      nameController.text.isNotEmpty &&
      numberController.text.isNotEmpty;

  void validateName(String value) {
    if (value.isEmpty) {
      nameError = "Name cannot be empty";
    } else if (value.length < 3) {
      nameError = "Name must be at least 3 characters";
    } else if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
      nameError = "Only letters allowed";
    } else {
      nameError = null;
    }
  }

  void validateNumber(String value) {
    if (value.isEmpty) {
      numberError = "This field cannot be empty";
    } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      numberError = "Only numbers allowed";
    } else if (value.length == 10 || value.length == 12) {
      numberError = null; 
    } else {
      numberError = "Enter 10 digit Mobile or 12 digit Aadhaar";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                      'assets/lock.png',
                      height: 160,
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      "Your journey starts with Signing in",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // NAME FIELD + VALIDATION
                    _inputBox(
                      controller: nameController,
                      hint: "Name",
                      hintStyle: TextStyle(fontWeight: FontWeight.w500),
                      onChanged: (value) {
                        setState(() => validateName(value));
                      },
                    ),
                    if (nameError != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          nameError!,
                          style: const TextStyle(
                              color: Colors.red, fontSize: 12),
                        ),
                      ),

                    const SizedBox(height: 10),
                    _inputBox(
                      controller: numberController,
                      hint: "Mobile Number / Aadhar Number",
                      hintStyle: TextStyle(fontWeight: FontWeight.w500),
                      onChanged: (value) {
                        setState(() => validateNumber(value));
                      },
                    ),
                    if (numberError != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          numberError!,
                          style: const TextStyle(
                              color: Colors.red, fontSize: 12),
                        ),
                      ),

                    const SizedBox(height: 20),

                    GestureDetector(
                      onTap: isValidForm
    ? () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const OtpScreen()),
        );
      }
    : null,

                      child: Container(
                        width: 130,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(
                            colors: isValidForm
                                ? const [
                                    Color(0xFF374198),
                                    Color(0xFF050735),
                                  ]
                                : [
                                    Color.fromRGBO(55, 65, 152, 0.5),
                                    Color.fromRGBO(5, 7, 53, 0.5),
                                  ],
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(58, 41, 106, 0.2),
                              blurRadius: 3,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          "Get OTP",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    RichText(
                      text: TextSpan(
                        text: "Already have an account ? ",
                        style: const TextStyle(
                            color: Colors.black87, fontSize: 12,fontWeight: FontWeight.w500),
                        children: [
                          TextSpan(
                            text: "Login",
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
                                        const AlphaLoginScreen(),
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
        ],
      ),
    );
  }

  Widget _inputBox({
    required TextEditingController controller,
    required String hint,
    required Function(String) onChanged,
    TextStyle? hintStyle,
  }) {
    return Container(
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
        controller: controller,
        textAlign: TextAlign.center,
        onChanged: onChanged,
        keyboardType: hint == "Name"
            ? TextInputType.name
            : TextInputType.number,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: hintStyle,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
        ),
      ),
    );
  }
}
