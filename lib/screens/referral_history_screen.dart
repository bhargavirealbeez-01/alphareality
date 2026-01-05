import 'package:flutter/material.dart';
import '../widgets/app_header.dart';
import '../widgets/bottom_nav.dart';

class ReferralHistoryScreen extends StatelessWidget {
  final VoidCallback onBack;
  final Function(String) onNavigate;

  const ReferralHistoryScreen({
    Key? key,
    required this.onBack,
    required this.onNavigate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final referrals = [
      {
        'name': 'Sarah Johnson',
        'date': '2 Jan 2026',
        'status': 'completed',
        'reward': '₹5,000',
      },
      {
        'name': 'Michael Chen',
        'date': '28 Dec 2025',
        'status': 'pending',
        'reward': '₹5,000',
      },
      {
        'name': 'Emma Williams',
        'date': '15 Dec 2025',
        'status': 'completed',
        'reward': '₹5,000',
      },
      {
        'name': 'David Brown',
        'date': '10 Dec 2025',
        'status': 'rejected',
        'reward': '₹0',
      },
      {
        'name': 'Lisa Anderson',
        'date': '5 Dec 2025',
        'status': 'completed',
        'reward': '₹5,000',
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
                          'Referral History',
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
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF10B981), Color(0xFF34D399)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Total Referrals',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '12',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Completed',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '8',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Earnings',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '₹40K',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  ...referrals.map(
                    (referral) => Container(
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
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFF60A5FA), Color(0xFFA855F7)],
                              ),
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  referral['name']!,
                                  style: const TextStyle(fontSize: 14),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  referral['date']!,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                referral['reward']!,
                                style: const TextStyle(fontSize: 14),
                              ),
                              const SizedBox(height: 4),
                              _buildStatusBadge(referral['status']!),
                            ],
                          ),
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

  Widget _buildStatusBadge(String status) {
    IconData icon;
    Color color;
    String text;

    switch (status) {
      case 'completed':
        icon = Icons.check_circle;
        color = Colors.green;
        text = 'Completed';
        break;
      case 'pending':
        icon = Icons.schedule;
        color = Colors.orange;
        text = 'Pending';
        break;
      case 'rejected':
        icon = Icons.cancel;
        color = Colors.red;
        text = 'Rejected';
        break;
      default:
        icon = Icons.help;
        color = Colors.grey;
        text = 'Unknown';
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 12, color: color),
        const SizedBox(width: 4),
        Text(text, style: TextStyle(fontSize: 12, color: color)),
      ],
    );
  }
}
