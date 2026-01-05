// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class AppColors {
//   static const primaryDarkBlue = Color(0xFF0A1E3A);
//   static const darkBlueGradientStart = Color(0xFF0A1E3A);
//   static const darkBlueGradientEnd = Color(0xFF143258);
//   static const goldAccent = Color(0xFFD4AF37);
//   static const lightGold = Color(0xFFFFE484);
//   static const white = Color(0xFFFFFFFF);
//   static const lightGray = Color(0xFFB0B8C5);
//   static const lightBlue = Color(0xFF4A90E2);
//   static const buttonBlue = Color(0xFF2D9CDB);
//   static const pillBlue = Color(0xFF1A2D4A);
//   static const yellowReward = Color(0xFFFFD700);
//   static const redReward = Color(0xFFE60023);
//   static const grayReward = Color(0xFF8C8C8C);
//   static const blackReward = Color(0xFF000000);
//   static const greenReward = Color(0xFF00704A);
//   static const ottGradientStart = Color(0xFF6A11CB);
//   static const ottGradientEnd = Color(0xFF2575FC);
//   static const bottomNavBar = Color(0xFF0A1E3A);
// }

// class AppTextStyles {
//   static final logoText = GoogleFonts.poppins(
//     fontSize: 14,
//     fontWeight: FontWeight.w700,
//     letterSpacing: 3,
//     color: AppColors.white,
//   );

//   static final exclusivePill = GoogleFonts.poppins(
//     fontSize: 12,
//     fontWeight: FontWeight.w500,
//     color: AppColors.white,
//   );

//   static final mainTitleWhite = GoogleFonts.poppins(
//     fontSize: 28,
//     fontWeight: FontWeight.w800,
//     letterSpacing: 1,
//     color: AppColors.white,
//   );

//   static final mainTitleGold = GoogleFonts.poppins(
//     fontSize: 28,
//     fontWeight: FontWeight.w800,
//     letterSpacing: 1,
//     color: AppColors.goldAccent,
//   );

//   static final subtitle = GoogleFonts.poppins(
//     fontSize: 14,
//     fontWeight: FontWeight.w400,
//     color: AppColors.lightGray,
//   );

//   static final eligibilityPill = GoogleFonts.poppins(
//     fontSize: 12,
//     fontWeight: FontWeight.w500,
//     color: AppColors.white,
//   );

//   static final sectionTitle = GoogleFonts.poppins(
//     fontSize: 18,
//     fontWeight: FontWeight.w700,
//     color: AppColors.white,
//   );

//   static final rewardStripMain = GoogleFonts.poppins(
//     fontSize: 16,
//     fontWeight: FontWeight.w600,
//     color: AppColors.white,
//   );

//   static final rewardStripSub = GoogleFonts.poppins(
//     fontSize: 12,
//     fontWeight: FontWeight.w500,
//     color: AppColors.white,
//   );

//   static final giftVoucherLabel = GoogleFonts.poppins(
//     fontSize: 16,
//     fontWeight: FontWeight.w600,
//     color: AppColors.white,
//   );

//   static final buttonText = GoogleFonts.poppins(
//     fontSize: 18,
//     fontWeight: FontWeight.w600,
//     color: AppColors.white,
//   );
// }

// class ReferralRewardsScreen extends StatefulWidget {
//   const ReferralRewardsScreen({super.key});

//   @override
//   State<ReferralRewardsScreen> createState() => _ReferralRewardsScreenState();
// }

// class _ReferralRewardsScreenState extends State<ReferralRewardsScreen> {
//   final PageController _pageController = PageController(viewportFraction: 0.8);
//   int _currentPage = 0;
//   Timer? _autoPlayTimer;

//   // You can update these asset paths once you add the final reward images.
//   final List<_RewardItem> _rewards = const [
//     _RewardItem(title: 'Gift Vouchers', assetPath: 'assets/carousel.png'),
//     _RewardItem(title: 'Iphone 17', assetPath: 'assets/carousel1.png'),
//     _RewardItem(title: 'Dubai Trip', assetPath: 'assets/carousel2.png'),
//   ];

//   @override
//   void initState() {
//     super.initState();
//     // Delay auto-play start until after PageView is built
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       if (mounted) {
//         _startAutoPlay();
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _autoPlayTimer?.cancel();
//     _pageController.dispose();
//     super.dispose();
//   }

//   void _startAutoPlay() {
//     _autoPlayTimer?.cancel();
//     _autoPlayTimer = Timer.periodic(const Duration(seconds: 4), (timer) {
//       if (!mounted || _rewards.isEmpty) return;
//       // Check if PageController is attached to a PageView before animating
//       if (!_pageController.hasClients) return;
//       final nextPage = (_currentPage + 1) % _rewards.length;
//       _pageController.animateToPage(
//         nextPage,
//         duration: const Duration(milliseconds: 500),
//         curve: Curves.easeInOut,
//       );
//     });
//   }

//   void _onReferFriend(BuildContext context) {
//     debugPrint('Refer a Friend tapped');
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(
//         content: Text('Refer a Friend tapped'),
//         duration: Duration(seconds: 2),
//       ),
//     );
//   }

//   void _onBottomNavTap(BuildContext context, String item) {
//     debugPrint('$item tapped');
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('$item tapped'),
//         duration: const Duration(seconds: 2),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       body: LayoutBuilder(
//         builder: (context, constraints) {
//           return Stack(
//             children: [
//               // Whole screen background
//               Container(
//                 width: constraints.maxWidth,
//                 height: constraints.maxHeight,
//                 decoration: const BoxDecoration(color: Color(0xFF081528)),
//               ),

//               // Content layer
//               SafeArea(
//                 child: Column(
//                   children: [
//                     Expanded(
//                       child: SingleChildScrollView(
//                         child: Column(
//                           children: [
//                             // Top background section with eligibility pill positioned at bottom
//                             Stack(
//                               children: [
//                                 // Background container with rounded bottom edges
//                                 Container(
//                                   width: constraints.maxWidth,
//                                   decoration: const BoxDecoration(
//                                     color: Color(0xFF00314C),
//                                     borderRadius: BorderRadius.only(
//                                       bottomLeft: Radius.circular(35),
//                                       bottomRight: Radius.circular(35),
//                                     ),
//                                   ),
//                                   child: Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                       horizontal: 24,
//                                     ),
//                                     child: Column(
//                                       mainAxisSize: MainAxisSize.min,
//                                       children: [
//                                         const SizedBox(
//                                           height: 16,
//                                         ), // Reduced from 20
//                                         // Logo section - Centered
//                                         Center(child: _buildLogoSection()),
//                                         const SizedBox(
//                                           height: 20,
//                                         ), // Reduced from 24
//                                         // Exclusive Referral Program pill - Centered
//                                         Center(child: _buildExclusivePill()),
//                                         const SizedBox(
//                                           height: 24,
//                                         ), // Reduced from 32
//                                         // Main title - Centered
//                                         Center(child: _buildMainTitle()),
//                                         const SizedBox(
//                                           height: 8,
//                                         ), // Reduced from 12
//                                         // Subtitle - Centered
//                                         Center(child: _buildSubtitle()),

//                                         // Add extra padding at bottom to make space for eligibility pill
//                                         const SizedBox(
//                                           height: 50,
//                                         ), // Reduced from 60
//                                       ],
//                                     ),
//                                   ),
//                                 ),

//                                 // Eligibility pill - positioned exactly at bottom of the background
//                                 Positioned(
//                                   left: 0,
//                                   right: 0,
//                                   bottom: 0,
//                                   child: Center(
//                                     child: Transform.translate(
//                                       offset: const Offset(
//                                         0,
//                                         15,
//                                       ), // Reduced from 20
//                                       child: _buildEligibilityPill(),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),

//                             // Rest of content below the top background
//                             Padding(
//                               padding: const EdgeInsets.symmetric(
//                                 horizontal: 24,
//                               ),
//                               child: Column(
//                                 children: [
//                                   const SizedBox(height: 50), // Reduced from 30
//                                   // Level 1 Reward Section - Centered
//                                   Center(child: _buildLevel1RewardSection()),
//                                   const SizedBox(height: 15), // Reduced from 10
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 15),
//                     // Refer a Friend button
//                     _buildReferButton(context),
//                   ],
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//       bottomNavigationBar: _buildBottomNavBar(context),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       floatingActionButton: _buildFloatingActionButton(context),
//     );
//   }

//   Widget _buildLogoSection() {
//     return Column(
//       children: [
//         const Icon(
//           Icons.shield,
//           size: 56,
//           color: AppColors.white,
//         ), // Reduced from 64
//         const SizedBox(height: 6), // Reduced from 8
//         Text('ALPHA REALTY', style: AppTextStyles.logoText),
//       ],
//     );
//   }

//   Widget _buildExclusivePill() {
//     return Container(
//       padding: const EdgeInsets.symmetric(
//         horizontal: 18,
//         vertical: 8,
//       ), // Reduced padding
//       decoration: BoxDecoration(
//         color: AppColors.pillBlue,
//         borderRadius: BorderRadius.circular(30),
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           const Icon(
//             Icons.add,
//             size: 14,
//             color: AppColors.white,
//           ), // Reduced from 16
//           const SizedBox(width: 6), // Reduced from 8
//           Text(
//             'Exclusive Referral Program',
//             style: AppTextStyles.exclusivePill.copyWith(
//               fontSize: 11,
//             ), // Reduced font
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildMainTitle() {
//     return RichText(
//       textAlign: TextAlign.center,
//       text: TextSpan(
//         children: [
//           TextSpan(
//             text: 'REFER & EARN\n',
//             style: AppTextStyles.mainTitleWhite.copyWith(
//               fontSize: 24,
//             ), // Reduced from 28
//           ),
//           TextSpan(
//             text: 'REAL ',
//             style: AppTextStyles.mainTitleGold.copyWith(
//               fontSize: 24,
//             ), // Reduced from 28
//           ),
//           TextSpan(
//             text: 'REWARDS',
//             style: AppTextStyles.mainTitleWhite.copyWith(
//               fontSize: 24,
//             ), // Reduced from 28
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildSubtitle() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16), // Reduced padding
//       child: Text(
//         'when your referral successfully buys a property',
//         textAlign: TextAlign.center,
//         style: AppTextStyles.subtitle.copyWith(fontSize: 13), // Reduced from 14
//       ),
//     );
//   }

//   Widget _buildEligibilityPill() {
//     return Container(
//       padding: const EdgeInsets.symmetric(
//         horizontal: 16,
//         vertical: 10,
//       ), // Reduced padding
//       decoration: BoxDecoration(
//         color: AppColors.pillBlue,
//         borderRadius: BorderRadius.circular(18), // Reduced from 20
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.15), // Reduced opacity
//             blurRadius: 6, // Reduced from 8
//             spreadRadius: 0.5, // Reduced from 1
//           ),
//         ],
//       ),
//       child: Text(
//         'For women who live in PG / Hostels / Shared Flats',
//         style: AppTextStyles.eligibilityPill.copyWith(
//           fontSize: 11,
//         ), // Reduced from 12
//       ),
//     );
//   }

//   Widget _buildLevel1RewardSection() {
//     if (_rewards.isEmpty) {
//       return const SizedBox.shrink();
//     }

//     // Calculate current level based on carousel position (1-indexed)
//     final currentLevel = _currentPage + 1;

//     return Column(
//       children: [
//         // Section title - dynamically updates based on carousel position
//         Text(
//           'Level $currentLevel Reward',
//           style: AppTextStyles.sectionTitle.copyWith(
//             fontSize: 16,
//           ), // Reduced from 18
//         ),
//         const SizedBox(height: 6), // Reduced from 8
//         // Underline effect
//         Container(
//           width: 50, // Reduced from 60
//           height: 2.5, // Reduced from 3
//           decoration: BoxDecoration(
//             color: AppColors.lightGold,
//             borderRadius: BorderRadius.circular(2),
//             boxShadow: [
//               BoxShadow(
//                 color: AppColors.lightGold.withOpacity(0.4), // Reduced opacity
//                 blurRadius: 3, // Reduced from 4
//                 spreadRadius: 0.5, // Reduced from 1
//               ),
//             ],
//           ),
//         ),
//         const SizedBox(height: 12), // Reduced from 16

//         SizedBox(
//           height: 360, // Reduced from 400
//           child: PageView.builder(
//             controller: _pageController,
//             itemCount: _rewards.length,
//             onPageChanged: (index) {
//               setState(() => _currentPage = index);
//             },
//             itemBuilder: (context, index) {
//               final reward = _rewards[index];
//               final isActive = index == _currentPage;

//               return AnimatedScale(
//                 duration: const Duration(milliseconds: 200), // Faster animation
//                 scale: isActive ? 1.0 : 0.95,
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     ClipRRect(
//                       borderRadius: const BorderRadius.only(
//                         topLeft: Radius.circular(16), // Reduced from 20
//                         topRight: Radius.circular(16), // Reduced from 20
//                         bottomLeft: Radius.circular(16), // Reduced from 20
//                         bottomRight: Radius.circular(16), // Reduced from 20
//                       ),
//                       child: Image.asset(
//                         reward.assetPath,
//                         width: 180, // Reduced from 202
//                         height: 230, // Reduced from 258
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     const SizedBox(height: 8), // Reduced from 12
//                     Text(
//                       reward.title,
//                       style: AppTextStyles.giftVoucherLabel.copyWith(
//                         fontSize: 15,
//                       ), // Reduced from 16
//                     ),

//                     // 3-line indicator under the reward name
//                     const SizedBox(height: 6), // Reduced from 8
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: List.generate(_rewards.length, (dotIndex) {
//                         final selected = dotIndex == _currentPage;
//                         return AnimatedContainer(
//                           duration: const Duration(milliseconds: 200), // Faster
//                           margin: const EdgeInsets.symmetric(
//                             horizontal: 3,
//                           ), // Reduced
//                           height: 2.5, // Reduced from 3
//                           width: selected ? 20 : 14, // Reduced sizes
//                           decoration: BoxDecoration(
//                             color: selected
//                                 ? AppColors.lightGold
//                                 : AppColors.lightGray.withOpacity(0.4),
//                             borderRadius: BorderRadius.circular(1.5),
//                           ),
//                         );
//                       }),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildReferButton(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(
//         horizontal: 24,
//         vertical: 12,
//       ), // Reduced vertical padding
//       child: ElevatedButton(
//         onPressed: () => _onReferFriend(context),
//         style: ElevatedButton.styleFrom(
//           backgroundColor: AppColors.buttonBlue,
//           foregroundColor: AppColors.white,
//           minimumSize: const Size(double.infinity, 50), // Reduced from 56
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(25), // Reduced from 30
//           ),
//           elevation: 3, // Reduced from 4
//           shadowColor: AppColors.buttonBlue.withOpacity(0.4),
//         ),
//         child: Text(
//           'Refer a Friend',
//           style: AppTextStyles.buttonText.copyWith(
//             fontSize: 16,
//           ), // Reduced from 18
//         ),
//       ),
//     );
//   }

//   Widget _buildBottomNavBar(BuildContext context) {
//     return BottomAppBar(
//       height: 60, // Reduced from 70
//       color: AppColors.bottomNavBar,
//       padding: EdgeInsets.zero,
//       surfaceTintColor: Colors.transparent,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           _buildBottomNavItem(
//             context: context,
//             icon: Icons.home,
//             isSelected: true,
//             itemName: 'Home',
//           ),
//           _buildBottomNavItem(
//             context: context,
//             icon: Icons.group_outlined,
//             itemName: 'Referrals',
//           ),
//           const SizedBox(width: 48), // Reduced from 56
//           _buildBottomNavItem(
//             context: context,
//             icon: Icons.card_giftcard_outlined,
//             itemName: 'Rewards',
//           ),
//           _buildBottomNavItem(
//             context: context,
//             icon: Icons.settings_outlined,
//             itemName: 'Settings',
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildBottomNavItem({
//     required BuildContext context,
//     required IconData icon,
//     bool isSelected = false,
//     required String itemName,
//   }) {
//     return GestureDetector(
//       onTap: () => _onBottomNavTap(context, itemName),
//       child: Container(
//         width: 36, // Reduced from 40
//         height: 36, // Reduced from 40
//         decoration: isSelected
//             ? BoxDecoration(
//                 color: AppColors.lightBlue,
//                 borderRadius: BorderRadius.circular(10), // Reduced from 12
//               )
//             : null,
//         child: Icon(
//           icon,
//           color: isSelected ? AppColors.white : AppColors.lightGray,
//           size: 22, // Reduced from 24
//         ),
//       ),
//     );
//   }

//   Widget _buildFloatingActionButton(BuildContext context) {
//     return FloatingActionButton(
//       onPressed: () => _onBottomNavTap(context, 'Support'),
//       backgroundColor: AppColors.lightBlue,
//       foregroundColor: AppColors.white,
//       shape: const CircleBorder(),
//       elevation: 3, // Reduced from 4
//       child: const Icon(
//         Icons.chat_bubble_outline,
//         size: 22,
//       ), // Reduced from default
//     );
//   }
// }

// class _RewardItem {
//   final String title;
//   final String assetPath;

//   const _RewardItem({required this.title, required this.assetPath});
// }

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Alpha Realty',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: false),
//       home: const ReferralRewardsScreen(),
//     );
//   }
// }
