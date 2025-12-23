import 'package:flutter/material.dart';
import 'package:alphareality/widgets/bottom_bar.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ReferDetailsScreen(),
  ));
}

class ReferDetailsScreen extends StatefulWidget {
  const ReferDetailsScreen({super.key});

  @override
  State<ReferDetailsScreen> createState() => _ReferDetailsScreenState();
}

class _ReferDetailsScreenState extends State<ReferDetailsScreen> {
  bool acceptedRules = false;

  int _selectedIndex = 0; // <<< FIXED: You forgot this

  final List<Map<String, String>> stepData = [
    {
      "icon": "assets/icons/i1.png",
      "text": "Lorem ipsum dolor sit amet, consectetur, Lorem ipsum dolor sit amet, ",
    },
    {
      "icon": "assets/icons/i2.png",
      "text": "Lorem ipsum dolor sit amet, consectetur, Lorem ipsum dolor sit amet",
    },
    {
      "icon": "assets/icons/i3.png",
      "text": "Friend completes first transaction.You receive rewards instantly.",
    },
    {
      "icon": "assets/icons/i4.png",
      "text": "You receive rewards instantly.",
    },
    {
      "icon": "assets/icons/i5.png",
      "text": "Lorem ipsum dolor sit amet, consectetur, Lorem ipsum dolor sit amet",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final double W = constraints.maxWidth;
            final double P = W * 0.04;

            return SingleChildScrollView(
              child: Column(
                children: [
                 Padding(
  padding: EdgeInsets.symmetric(horizontal: P),
  child: Column(
    children: [
      const SizedBox(height: 70),

      Row(
        children: [
          // BACK BUTTON
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios_new,
              color: const Color.fromRGBO(113, 1, 182, 1), 
              size: 22,
            ),
          ),

          // SPACER
          Expanded(
            child: Center(
              child: Image.asset(
                'assets/logo.png',
                height: 98,
                      width: 250,
                fit: BoxFit.contain,
              ),
            ),
          ),

          // RIGHT SIDE EMPTY FOR PERFECT CENTERING
          SizedBox(width: 22), // Same width as back icon
        ],
      ),

      Image.asset(
        'assets/refer_earn.png',
         height: 120,
                      width: 370,
        fit: BoxFit.contain,
      ),

      SizedBox(height: W * 0.05),
    ],
  ),
),

                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
  topLeft: Radius.circular(16),
  topRight: Radius.circular(16),
),

                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF11110F),
                              Color(0xFF26231E),
                            ],
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: W * 0.048,
                          vertical: W * 0.07,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 6,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'HOW TO GET',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      SizedBox(height: W * 0.03),

                                      Column(
                                        children: List.generate(stepData.length, (index) {
                                          final step = stepData[index];

                                          return Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Column(
                                                children: [
                                                  Container(
                                                    width: W * 0.06,
                                                    height: W * 0.06,
                                                    child: Image.asset(
                                                      step['icon']!,
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),

                                                  if (index != stepData.length - 1)
                                                    Container(
                                                      width: 2,
                                                      height: W * 0.14,
                                                      decoration: BoxDecoration(
                                                        gradient: LinearGradient(
                                                          begin: Alignment.topCenter,
                                                          end: Alignment.bottomCenter,
                                                          colors: [
                                                            Colors.transparent,
                                                            Color(0xFF8A8CB2).withOpacity(0.6),
                                                            Colors.transparent,
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),

                                              SizedBox(width: W * 0.04),

                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsets.only(top: 0),
                                                  child: Text(
                                                    step['text']!,
                                                    style: TextStyle(
                                                      color: Colors.white70,
                                                      fontSize: 12,
                                                      height: 1.3,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        }),
                                      ),
                                    ],
                                  ),
                                ),

                                const Expanded(flex: 4, child: SizedBox()),
                              ],
                            ),

                            SizedBox(height: W * 0.08),

                            Text(
  "RULES",
  textAlign: TextAlign.center, 
  style: TextStyle(
    color: Colors.white,
    fontSize: W * 0.042,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.underline,
    decorationColor: Colors.white,
  ),
),


                            SizedBox(height: W * 0.04),

                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.only(left: W * 0.25),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: List.generate(4, (i) {
                                  return Padding(
                                    padding: EdgeInsets.only(bottom: W * 0.03),
                                    child: Text(
                                      "${i + 1}. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio.",
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 12,
                                        height: 1.3,
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ),

                            SizedBox(height: W * 0.04),

                            GestureDetector(
                              onTap: () {
                                setState(() => acceptedRules = !acceptedRules);
                              },
                              child: Row(
                                children: [
                                  Container(
                                    width: W * 0.055,
                                    height: W * 0.055,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3),
                                      color: Colors.white,
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1.5,
                                      ),
                                    ),
                                    child: acceptedRules
                                        ? const Icon(
                                            Icons.check,
                                            color: Colors.black,
                                            size: 18,
                                          )
                                        : null,
                                  ),

                                  SizedBox(width: W * 0.03),

                                  Text(
                                    "I accept Rules & Conditions",
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: W * 0.045,
                                    ),
                                  )
                                ],
                              ),
                            ),

                            SizedBox(height: W * 0.06),

                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromRGBO(155, 155, 155, 1),
                                  foregroundColor: Colors.black,
                                  padding: const EdgeInsets.symmetric(vertical: 14),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                onPressed: () {
                                  if (!acceptedRules) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text("Please accept the rules first")),
                                    );
                                  }
                                },
                                child: Text(
                                  "ADD REFERRAL DETAILS",
                                  style: TextStyle(
                                    fontSize: W * 0.038,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Positioned(
                        left: -W * 0.08,
                        top: W * 1.28,
                        child: SizedBox(
                          width: W * 0.35,
                          height: W * 0.6,
                          child: Image.asset(
                            'assets/side.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),

                      Positioned(
                        right: W * 0.02,
                        top: 30,
                        child: SizedBox(
                          width: W * 0.55,
                          height: W * 1.0,
                          child: Image.asset(
                            'assets/side.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),

      // ---------------- BOTTOM NAV BAR ----------------
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onTap: (index) {
          setState(() => _selectedIndex = index);
        },
      ),
    );
  }
}
