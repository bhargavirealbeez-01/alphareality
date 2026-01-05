import 'package:flutter/material.dart';
import 'screens/intro_screen.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/referral_screen.dart';
import 'screens/support_screen.dart';
import 'screens/rewards_screen.dart';
import 'screens/privacy_screen.dart';
import 'screens/referral_history_screen.dart';
import 'screens/help_support_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/invite_friend_screen.dart';

void main() {
  runApp(const AlphaRealityApp());
}

class AlphaRealityApp extends StatelessWidget {
  const AlphaRealityApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alpha Reality',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[100],
        fontFamily: 'Inter',
      ),
      home: const AppNavigator(),
    );
  }
}

class AppNavigator extends StatefulWidget {
  const AppNavigator({Key? key}) : super(key: key);

  @override
  State<AppNavigator> createState() => _AppNavigatorState();
}

class _AppNavigatorState extends State<AppNavigator> {
  String _currentScreen = 'intro';
  bool _showLogoutDialog = false;

  void _navigateToScreen(String screen) {
    setState(() {
      _currentScreen = screen;
    });
  }

  void _showLogout() {
    setState(() {
      _showLogoutDialog = true;
    });
  }

  void _handleLogout() {
    setState(() {
      _showLogoutDialog = false;
      _currentScreen = 'intro';
    });
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Logged out successfully!')));
  }

  Widget _getCurrentScreen() {
    switch (_currentScreen) {
      case 'intro':
        return IntroScreen(
          onLogin: () => _navigateToScreen('login'),
          onSignup: () => _navigateToScreen('signup'),
        );
      case 'login':
        return LoginScreen(
          onBack: () => _navigateToScreen('intro'),
          onLogin: () => _navigateToScreen('profile'),
        );
      case 'signup':
        return SignupScreen(
          onBack: () => _navigateToScreen('intro'),
          onSignup: () => _navigateToScreen('profile'),
        );
      case 'profile':
        return ProfileScreen(
          onNavigate: _navigateToScreen,
          onMenuItemClick: (item) {
            if (item == 'logout') {
              _showLogout();
            } else {
              _navigateToScreen(item);
            }
          },
        );
      case 'referral':
        return ReferralScreen(onNavigate: _navigateToScreen);
      case 'support':
        return SupportScreen(onNavigate: _navigateToScreen);
      case 'rewards':
        return RewardsScreen(onNavigate: _navigateToScreen);
      case 'privacy':
        return PrivacyScreen(
          onBack: () => _navigateToScreen('profile'),
          onNavigate: _navigateToScreen,
        );
      case 'referral-history':
        return ReferralHistoryScreen(
          onBack: () => _navigateToScreen('profile'),
          onNavigate: _navigateToScreen,
        );
      case 'help-support':
        return HelpSupportScreen(
          onBack: () => _navigateToScreen('profile'),
          onNavigate: _navigateToScreen,
        );
      case 'settings':
        return SettingsScreen(
          onBack: () => _navigateToScreen('profile'),
          onNavigate: _navigateToScreen,
        );
      case 'invite-friend':
        return InviteFriendScreen(
          onBack: () => _navigateToScreen('profile'),
          onNavigate: _navigateToScreen,
        );
      default:
        return IntroScreen(
          onLogin: () => _navigateToScreen('login'),
          onSignup: () => _navigateToScreen('signup'),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: _getCurrentScreen(),
              ),
            ),
          ),
          if (_showLogoutDialog) _buildLogoutDialog(),
        ],
      ),
    );
  }

  Widget _buildLogoutDialog() {
    return Container(
      color: Colors.black.withOpacity(0.5),
      child: Center(
        child: Container(
          width: 280,
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: Colors.red[100],
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.logout, size: 32, color: Colors.red),
              ),
              const SizedBox(height: 16),
              const Text(
                'Logout',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Are you sure you want to logout?',
                style: TextStyle(fontSize: 14, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _handleLogout,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: const Text('Yes, Logout'),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _showLogoutDialog = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[200],
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: const Text('Cancel'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
