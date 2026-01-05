import 'package:flutter/material.dart';
import '../widgets/app_header.dart';
import '../widgets/bottom_nav.dart';

class HelpSupportScreen extends StatelessWidget {
  final VoidCallback onBack;
  final Function(String) onNavigate;

  const HelpSupportScreen({
    Key? key,
    required this.onBack,
    required this.onNavigate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final supportOptions = [
      {
        'icon': Icons.chat_bubble_outline,
        'label': 'Live Chat',
        'description': 'Chat with our support team',
        'gradient': const LinearGradient(
            colors: [Color(0xFF60A5FA), Color(0xFF3B82F6)]),
      },
      {
        'icon': Icons.email,
        'label': 'Email Support',
        'description': 'support@alphareality.com',
        'gradient': const LinearGradient(
            colors: [Color(0xFFA855F7), Color(0xFF9333EA)]),
      },
      {
        'icon': Icons.phone,
        'label': 'Call Us',
        'description': '+91 98765 43210',
        'gradient': const LinearGradient(
            colors: [Color(0xFF10B981), Color(0xFF34D399)]),
      },
      {
        'icon': Icons.description,
        'label': 'FAQs',
        'description': 'Find answers to common questions',
        'gradient': const LinearGradient(
            colors: [Color(0xFFF59E0B), Color(0xFFFBBF24)]),
      },
    ];

    final faqs = [
      'How does the referral program work?',
      'When will I receive my rewards?',
      'Can I refer multiple people?',
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: onBack,
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
                          'Help & Support',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
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
                        colors: [Color(0xFF3B82F6), Color(0xFF60A5FA)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Column(
                      children: [
                        Icon(Icons.chat_bubble_outline,
                            color: Colors.white, size: 48),
                        SizedBox(height: 12),
                        Text(
                          'We\'re here to help you 24/7',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  ...supportOptions.map((option) => InkWell(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text('Opening ${option['label']}...')),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.grey[50],
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  gradient:
                                      option['gradient'] as LinearGradient,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  option['icon'] as IconData,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      option['label'] as String,
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      option['description'] as String,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                  const SizedBox(height: 16),
                  const Text(
                    'Common Questions',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 12),
                  ...faqs.map((faq) => Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.grey[50],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          faq,
                          style: const TextStyle(fontSize: 12),
                        ),
                      )),
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
