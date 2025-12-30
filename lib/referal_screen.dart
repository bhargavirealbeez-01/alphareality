import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const primaryDarkBlue = Color(0xFF0A1E3A);
  static const darkBlueGradientStart = Color(0xFF0A1E3A);
  static const darkBlueGradientEnd = Color(0xFF143258);
  static const goldAccent = Color(0xFFD4AF37);
  static const lightGold = Color(0xFFFFE484);
  static const white = Color(0xFFFFFFFF);
  static const lightGray = Color(0xFFB0B8C5);
  static const lightBlue = Color(0xFF4A90E2);
  static const buttonBlue = Color(0xFF2D9CDB);
  static const pillBlue = Color(0xFF1A2D4A);
  static const yellowReward = Color(0xFFFFD700);
  static const redReward = Color(0xFFE60023);
  static const grayReward = Color(0xFF8C8C8C);
  static const blackReward = Color(0xFF000000);
  static const greenReward = Color(0xFF00704A);
  static const ottGradientStart = Color(0xFF6A11CB);
  static const ottGradientEnd = Color(0xFF2575FC);
  static const bottomNavBar = Color(0xFF0A1E3A);
}

class AppTextStyles {
  static final logoText = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    letterSpacing: 3,
    color: AppColors.white,
  );

  static final exclusivePill = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );

  static final mainTitleWhite = GoogleFonts.poppins(
    fontSize: 28,
    fontWeight: FontWeight.w800,
    letterSpacing: 1,
    color: AppColors.white,
  );

  static final mainTitleGold = GoogleFonts.poppins(
    fontSize: 28,
    fontWeight: FontWeight.w800,
    letterSpacing: 1,
    color: AppColors.goldAccent,
  );

  static final subtitle = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.lightGray,
  );

  static final eligibilityPill = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );

  static final sectionTitle = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  );

  static final rewardStripMain = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );

  static final rewardStripSub = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );

  static final giftVoucherLabel = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );

  static final buttonText = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );
}

class ReferralRewardsScreen extends StatelessWidget {
  const ReferralRewardsScreen({super.key});

  void _onReferFriend(BuildContext context) {
    debugPrint('Refer a Friend tapped');
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Refer a Friend tapped'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _onBottomNavTap(BuildContext context, String item) {
    debugPrint('$item tapped');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$item tapped'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.darkBlueGradientStart,
              AppColors.darkBlueGradientEnd,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),

                        // Logo section
                        _buildLogoSection(),
                        const SizedBox(height: 24),

                        // Exclusive Referral Program pill
                        _buildExclusivePill(),
                        const SizedBox(height: 32),

                        // Main title
                        _buildMainTitle(),
                        const SizedBox(height: 12),

                        // Subtitle
                        _buildSubtitle(),
                        const SizedBox(height: 10),

                        // Eligibility pill
                        _buildEligibilityPill(),
                        const SizedBox(height: 10),

                        _buildLevel1RewardSection(),
                        const SizedBox(height: 10),

                        _buildGiftVouchersLabel(),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ),

              // Refer a Friend button
              _buildReferButton(context),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _buildFloatingActionButton(context),
    );
  }

  Widget _buildLogoSection() {
    return Column(
      children: [
        const Icon(Icons.shield, size: 64, color: AppColors.white),
        const SizedBox(height: 8),
        Text('ALPHA REALTY', style: AppTextStyles.logoText),
      ],
    );
  }

  Widget _buildExclusivePill() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.pillBlue,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.add, size: 16, color: AppColors.white),
          const SizedBox(width: 8),
          Text(
            'Exclusive Referral Program',
            style: AppTextStyles.exclusivePill,
          ),
        ],
      ),
    );
  }

  Widget _buildMainTitle() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(text: 'REFER & EARN\n', style: AppTextStyles.mainTitleWhite),
          TextSpan(text: 'REAL ', style: AppTextStyles.mainTitleGold),
          TextSpan(text: 'REWARDS', style: AppTextStyles.mainTitleWhite),
        ],
      ),
    );
  }

  Widget _buildSubtitle() {
    return Text(
      'when your referral successfully buys a property',
      textAlign: TextAlign.center,
      style: AppTextStyles.subtitle,
    );
  }

  Widget _buildEligibilityPill() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.pillBlue.withOpacity(0.8),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        'For women who live in PG / Hostels / Shared Flats',
        style: AppTextStyles.eligibilityPill,
      ),
    );
  }

  Widget _buildLevel1RewardSection() {
    return Column(
      children: [
        // Section title
        Text('Level 1 Reward', style: AppTextStyles.sectionTitle),
        const SizedBox(height: 8),

        // Underline effect
        Container(
          width: 60,
          height: 3,
          decoration: BoxDecoration(
            color: AppColors.lightGold,
            borderRadius: BorderRadius.circular(2),
            boxShadow: [
              BoxShadow(
                color: AppColors.lightGold.withOpacity(0.5),
                blurRadius: 4,
                spreadRadius: 1,
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),

          child: ClipRRect(
            child: Image.asset(
              'assets/carousel.png',

              height: 300,
              width: double.infinity,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGiftVouchersLabel() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.star, size: 20, color: AppColors.goldAccent),
        const SizedBox(width: 12),
        Container(
          width: 2,
          height: 24,
          color: AppColors.lightGray.withOpacity(0.5),
        ),
        const SizedBox(width: 12),
        Text('Gift Vouchers', style: AppTextStyles.giftVoucherLabel),
        const SizedBox(width: 12),
        Container(
          width: 2,
          height: 24,
          color: AppColors.lightGray.withOpacity(0.5),
        ),
        const SizedBox(width: 12),
        const Icon(Icons.star, size: 20, color: AppColors.goldAccent),
      ],
    );
  }

  Widget _buildReferButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: ElevatedButton(
        onPressed: () => _onReferFriend(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.buttonBlue,
          foregroundColor: AppColors.white,
          minimumSize: const Size(double.infinity, 56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 4,
          shadowColor: AppColors.buttonBlue.withOpacity(0.5),
        ),
        child: Text('Refer a Friend', style: AppTextStyles.buttonText),
      ),
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return BottomAppBar(
      height: 70,
      color: AppColors.bottomNavBar,
      padding: EdgeInsets.zero,
      surfaceTintColor: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildBottomNavItem(
            context: context,
            icon: Icons.home,
            isSelected: true,
            itemName: 'Home',
          ),
          _buildBottomNavItem(
            context: context,
            icon: Icons.group_outlined,
            itemName: 'Referrals',
          ),
          const SizedBox(width: 56), // Space for FAB
          _buildBottomNavItem(
            context: context,
            icon: Icons.card_giftcard_outlined,
            itemName: 'Rewards',
          ),
          _buildBottomNavItem(
            context: context,
            icon: Icons.settings_outlined,
            itemName: 'Settings',
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavItem({
    required BuildContext context,
    required IconData icon,
    bool isSelected = false,
    required String itemName,
  }) {
    return GestureDetector(
      onTap: () => _onBottomNavTap(context, itemName),
      child: Container(
        width: 40,
        height: 40,
        decoration: isSelected
            ? BoxDecoration(
                color: AppColors.lightBlue,
                borderRadius: BorderRadius.circular(12),
              )
            : null,
        child: Icon(
          icon,
          color: isSelected ? AppColors.white : AppColors.lightGray,
          size: 24,
        ),
      ),
    );
  }

  Widget _buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => _onBottomNavTap(context, 'Support'),
      backgroundColor: AppColors.lightBlue,
      foregroundColor: AppColors.white,
      shape: const CircleBorder(),
      elevation: 4,
      child: const Icon(Icons.chat_bubble_outline),
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alpha Realty',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: false),
      home: const ReferralRewardsScreen(),
    );
  }
}
