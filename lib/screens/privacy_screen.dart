import 'package:flutter/material.dart';
import '../widgets/app_header.dart';
import '../widgets/bottom_nav.dart';

class PrivacyScreen extends StatefulWidget {
  final VoidCallback onBack;
  final Function(String) onNavigate;

  const PrivacyScreen({
    Key? key,
    required this.onBack,
    required this.onNavigate,
  }) : super(key: key);

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  List<Map<String, dynamic>> settings = [
    {
      'icon': Icons.visibility,
      'label': 'Profile Visibility',
      'description': 'Control who can see your profile',
      'enabled': true,
    },
    {
      'icon': Icons.notifications,
      'label': 'Activity Status',
      'description': 'Show when you are online',
      'enabled': false,
    },
    {
      'icon': Icons.lock,
      'label': 'Data Sharing',
      'description': 'Share data with partners',
      'enabled': false,
    },
    {
      'icon': Icons.shield,
      'label': 'Two-Factor Authentication',
      'description': 'Extra security for your account',
      'enabled': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
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
                    children: [
                      InkWell(
                        onTap: widget.onBack,
                        child: Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.arrow_back, size: 20),
                        ),
                      ),
                      const Expanded(
                        child: Text(
                          'Privacy',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(width: 32),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFA855F7), Color(0xFF9333EA)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Column(
                      children: [
                        Icon(Icons.shield, color: Colors.white, size: 48),
                        SizedBox(height: 12),
                        Text(
                          'Your privacy matters to us',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  ...settings.asMap().entries.map((entry) {
                    int index = entry.key;
                    Map<String, dynamic> setting = entry.value;
                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(setting['icon'], size: 20),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  setting['label'],
                                  style: const TextStyle(fontSize: 14),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  setting['description'],
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Switch(
                            value: setting['enabled'],
                            onChanged: (value) {
                              setState(() {
                                settings[index]['enabled'] = value;
                              });
                            },
                          ),
                        ],
                      ),
                    );
                  }),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Privacy settings saved!'),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[200],
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      child: const Text('SAVE CHANGES'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          BottomNav(activeTab: 'profile', onNavigate: widget.onNavigate),
        ],
      ),
    );
  }
}
