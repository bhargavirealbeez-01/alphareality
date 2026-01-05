import 'package:flutter/material.dart';
import '../widgets/app_header.dart';
import '../widgets/bottom_nav.dart';

class ProfileScreen extends StatelessWidget {
  final Function(String) onNavigate;
  final Function(String) onMenuItemClick;

  const ProfileScreen({
    Key? key,
    required this.onNavigate,
    required this.onMenuItemClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final menuItems = [
      {'icon': Icons.shield, 'label': 'Privacy', 'key': 'privacy'},
      {
        'icon': Icons.history,
        'label': 'Referral History',
        'key': 'referral-history',
      },
      {
        'icon': Icons.help_outline,
        'label': 'Help & Support',
        'key': 'help-support',
      },
      {'icon': Icons.settings, 'label': 'Settings', 'key': 'settings'},
      {
        'icon': Icons.person_add,
        'label': 'Invite a Friend',
        'key': 'invite-friend',
      },
    ];

    return Container(
      width: 280,
      height: 600,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          const AppHeader(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.arrow_back, size: 20),
                      ),
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.edit, size: 16),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                        image: AssetImage('assets/images/profile.png'),
                        fit: BoxFit.cover,
                      ),
                      gradient: LinearGradient(
                        colors: [Colors.blue[400]!, Colors.purple[500]!],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text('Vikrant Rathod', style: TextStyle(fontSize: 16)),
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: const Text(
                      'Refer & Earn',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  const SizedBox(height: 24),
                  ...menuItems.map(
                    (item) => InkWell(
                      onTap: () => onMenuItemClick(item['key'] as String),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 12,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              item['icon'] as IconData,
                              size: 16,
                              color: Colors.grey[600],
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                item['label'] as String,
                                style: const TextStyle(fontSize: 14),
                              ),
                            ),
                            Icon(
                              Icons.chevron_right,
                              size: 16,
                              color: Colors.grey[400],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  InkWell(
                    onTap: () => onMenuItemClick('logout'),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 12,
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.logout, size: 16, color: Colors.grey[600]),
                          const SizedBox(width: 12),
                          const Text('Logout', style: TextStyle(fontSize: 14)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          BottomNav(activeTab: 'profile', onNavigate: onNavigate),
        ],
      ),
    );
  }
}
