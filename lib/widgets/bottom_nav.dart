import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  final String activeTab;
  final Function(String) onNavigate;

  const BottomNav({Key? key, required this.activeTab, required this.onNavigate})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey[200]!, width: 1)),
      ),
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.person, 'profile', activeTab == 'profile'),
          _buildNavItem(
            Icons.chat_bubble_outline,
            'support',
            activeTab == 'support',
          ),
          _buildNavItem(
            Icons.card_giftcard,
            'rewards',
            activeTab == 'rewards',
            isGift: true,
          ),
          _buildNavItem(Icons.settings, 'settings', activeTab == 'settings'),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    IconData icon,
    String screen,
    bool isActive, {
    bool isGift = false,
  }) {
    return InkWell(
      onTap: () => onNavigate(screen),
      child: Opacity(
        opacity: isActive ? 1.0 : 0.4,
        child: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            size: 24,
            color: isGift ? Colors.red : Colors.black,
          ),
        ),
      ),
    );
  }
}
