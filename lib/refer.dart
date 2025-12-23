import 'package:alphareality/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ReferEarnScreen(),
  ));
}

class ReferEarnScreen extends StatefulWidget {
  const ReferEarnScreen({super.key});

  @override
  State<ReferEarnScreen> createState() => _ReferEarnScreenState();
}

class _ReferEarnScreenState extends State<ReferEarnScreen> {
  int _selectedIndex = 0; // 🔥 Added missing variable

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final double W = constraints.maxWidth;

            return SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 50),

                  // Logo
                  Center(
                    child: Image.asset(
                      'assets/logo.png',
                      height: 98,
                      width: 270,
                    ),
                  ),

                  const SizedBox(height: 6),

                  // Refer banner
                  Center(
                    child: Image.asset(
                      'assets/refer_earn.png',
                      height: 120,
                      width: 370,
                    ),
                  ),

                  const SizedBox(height: 30),

                  _iPhoneCard(context, W),
                  SizedBox(height: W * 0.06),
                  _MacBookCard(context, W),
                  SizedBox(height: W * 0.03),
                  _BikeCard(context, W),
                ],
              ),
            );
          },
        ),
      ),

      /// 🔥 No more errors – now inside StatefulWidget
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }

Widget _iPhoneCard(BuildContext context, double W) {
  final double cardWidth = W * 0.78;     // 🔥 reduced width
  final double cardHeight = W * 0.28;

  final double imageWidth = W * 0.42;
  final double imageHeight = W * 0.60;

  return Padding(
    padding: EdgeInsets.symmetric(horizontal: W * 0.06),
    child: Align(
      alignment: Alignment.centerLeft,   // 🔥 align container to start
      child: SizedBox(
        height: cardHeight + (imageHeight * 0.15),
        width: cardWidth,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            /// ---------- BLACK CARD ----------
            Container(
              width: cardWidth,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF1A1A1A),
                    Color(0xFF3A3A3A),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: cardWidth * 0.06,
                vertical: cardHeight * 0.12,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/refer_text.png',
                    height: cardHeight * 0.50,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: cardHeight * 0.03),
                  const Text(
                    "      iPhone",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
            ),

            /// ---------- IMAGE ----------
            Positioned(
              right: -W * 0.09,
              top: -W * 0.08,
              child: Image.asset(
                'assets/iphone.png',
                width: imageWidth,
                height: 160,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}


Widget _MacBookCard(BuildContext context, double W) {
  final double cardWidth = W * 0.78;    // 🔥 reduced width
  final double cardHeight = W * 0.28;

  final double imageWidth = W * 0.48;
  final double imageHeight = W * 0.78;

  return Padding(
    padding: EdgeInsets.symmetric(horizontal: W * 0.06),
    child: Align(
      alignment: Alignment.centerLeft,    // 🔥 align start
      child: SizedBox(
        height: cardHeight + (imageHeight * 0.18),
        width: cardWidth,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            /// BLACK CARD
            Container(
              width: cardWidth,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF1A1A1A),
                    Color(0xFF3A3A3A),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: cardWidth * 0.06,
                vertical: cardHeight * 0.12,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/refer_text.png',
                    height: cardHeight * 0.50,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: cardHeight * 0.03),
                  const Text(
                    " MacBook Pro",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
            ),

            /// DEVICE IMAGE
            Positioned(
              right: -W * 0.12,
              top: -W * 0.25,
              child: Image.asset(
                'assets/mac.png',
                width: imageWidth,
                height: imageHeight,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}


Widget _BikeCard(BuildContext context, double W) {
  final double cardWidth = W * 0.78;    // 🔥 reduced width
  final double cardHeight = W * 0.28;

  final double imageWidth = W * 0.45;
  final double imageHeight = W * 0.78;

  return Padding(
    padding: EdgeInsets.symmetric(horizontal: W * 0.06),
    child: Align(
      alignment: Alignment.centerLeft,    // 🔥 align start
      child: SizedBox(
        height: cardHeight + (imageHeight * 0.18),
        width: cardWidth,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            /// BLACK CARD
            Container(
              width: cardWidth,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF1A1A1A),
                    Color(0xFF3A3A3A),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: cardWidth * 0.06,
                vertical: cardHeight * 0.12,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/refer_text.png',
                    height: cardHeight * 0.50,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: cardHeight * 0.03),
                  const Text(
                    "   Harley X440",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
            ),

            /// BIKE IMAGE
            Positioned(
              right: -W * 0.17,
              top: -W * 0.25,
              child: Image.asset(
                'assets/bike.png',
                width: imageWidth,
                height: imageHeight,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
}