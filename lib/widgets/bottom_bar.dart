import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  BottomNavigationBarItem buildNavItem(String iconPath, int index, int selectedIndex) {
    return BottomNavigationBarItem(
      label: "",
      icon: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        padding: const EdgeInsets.all(0), // smaller padding → reduces height
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: (selectedIndex == index && (index == 0 || index == 3))
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 3,
                    offset: const Offset(0, 1.5),
                  )
                ]
              : [],
        ),
        child: AnimatedScale(
          scale: selectedIndex == index ? 1.2 : 1.0,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,

          /// 🔥 Reduced icon size
          child: Image.asset(
            iconPath,
            height: 40,  // ↓ from 50
            width: 40,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75, // 🔥 reduced nav bar height
      child: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          enableFeedback: false,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,

          // 🔥 reduces default nav bar extra space
          iconSize: 1,

          onTap: onTap,
          items: [
            buildNavItem('assets/icons/b1.png', 0, selectedIndex),
            buildNavItem('assets/icons/b2.png', 1, selectedIndex),
            buildNavItem('assets/icons/b3.png', 2, selectedIndex),
            buildNavItem('assets/icons/b4.png', 3, selectedIndex),
          ],
        ),
      ),
    );
  }
}
