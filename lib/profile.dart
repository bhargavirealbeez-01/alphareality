import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile Dashboard',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: false,
      ),
      home: const ProfileDashboardScreen(),
    );
  }
}

class ProfileDashboardScreen extends StatefulWidget {
  const ProfileDashboardScreen({super.key});

  @override
  State<ProfileDashboardScreen> createState() =>
      _ProfileDashboardScreenState();
}

class _ProfileDashboardScreenState extends State<ProfileDashboardScreen> {
  int _selectedIndex = 0;

  BottomNavigationBarItem buildNavItem(String iconPath, int index, String label) {
    return BottomNavigationBarItem(
      label: label,
      icon: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOut,
        padding: const EdgeInsets.all(3),
       decoration: BoxDecoration(
  shape: BoxShape.circle,
  boxShadow: (_selectedIndex == index && (index == 0 || index == 3))
      ? [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          )
        ]
      : [],
),

        child: AnimatedScale(
          scale: _selectedIndex == index ? 1.3 : 1.0,
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOut,
          child: Image.asset(
            iconPath,
            height: 50,
            width: 50,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 70),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: SizedBox(
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Image.asset(
                      'assets/logo.png',
                      height: 98,
                      width: 270,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              Stack(
                alignment: Alignment.center,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/profile.png'),
                  ),

                  Positioned(
                    bottom: -5,
                    right: -5,
                    child: Container(
                      height: 45,
                      width: 45,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Container(
                          height: 32,
                          width: 32,
                          decoration: const BoxDecoration(
                            color: Color(0xFFE0E0E0),
                            shape: BoxShape.circle,
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.edit_outlined,
                              size: 20,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              const Text(
                'Name',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 4),

              const Text(
                'ID: JOSEPH@123',
                style: TextStyle(
                  fontSize: 12,
                  color: Color.fromRGBO(2, 91, 255, 1),
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 25),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: const [
                    _ProfileMenuItem(
                      iconPath: 'assets/icons/p5.png',
                      title: 'Privacy',
                    ),
                    SizedBox(height: 10),

                    _ProfileMenuItem(
                      iconPath: 'assets/icons/p4.png',
                      title: 'Referral History',
                    ),
                    SizedBox(height: 10),

                    _ProfileMenuItem(
                      iconPath: 'assets/icons/p3.png',
                      title: 'Help & Support',
                    ),
                    SizedBox(height: 10),

                    _ProfileMenuItem(
                      iconPath: 'assets/icons/p2.png',
                      title: 'Invite a Friend',
                    ),
                    SizedBox(height: 10),

                    _ProfileMenuItem(
                      iconPath: 'assets/icons/p1.png',
                      title: 'Settings',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 10),
                child: SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(155, 155, 155, 1),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "LOGOUT",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 60),
            ],
          ),
        ),
      ),

      // ----------------- FIXED BOTTOM NAV (no grey hover circle) -----------------
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          enableFeedback: false, // disables tap ripple
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,

          items: [
            buildNavItem('assets/icons/b1.png', 0, 'Home'),
            buildNavItem('assets/icons/b2.png', 1, 'Activities'),
            buildNavItem('assets/icons/b3.png', 2, 'Rewards'),
            buildNavItem('assets/icons/b4.png', 3, 'Profile'),
          ],

          onTap: (index) {
            setState(() => _selectedIndex = index);
          },
        ),
      ),
    );
  }
}

class _ProfileMenuItem extends StatelessWidget {
  final String iconPath;
  final String title;

  const _ProfileMenuItem({
    required this.iconPath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(229, 229, 229, 1),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Image.asset(
            iconPath,
            height: 22,
            width: 22,
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          const Icon(
            Icons.arrow_forward_ios,
            size: 14,
            color: Colors.black54,
          ),
        ],
      ),
    );
  }
}
