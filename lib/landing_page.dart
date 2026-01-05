// import 'package:flutter/material.dart';

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
//       home: const AlphaRealityScreen(),
//     );
//   }
// }

// class AlphaRealityScreen extends StatefulWidget {
//   const AlphaRealityScreen({super.key});

//   @override
//   State<AlphaRealityScreen> createState() => _AlphaRealityScreenState();
// }

// class _AlphaRealityScreenState extends State<AlphaRealityScreen> {
//   int selectedIndex = 0;

//   final List<Map<String, String>> states = [
//     {"name": "Telangana", "image": "assets/images/states/telangana.png"},
//     {"name": "Andhra", "image": "assets/images/states/andhra.png"},
//     {"name": "Karnataka", "image": "assets/images/states/karnataka.png"},
//     {"name": "Tamil Nadu", "image": "assets/images/states/tamilnadu.png"},
//     {"name": "Kerala", "image": "assets/images/states/kerala.png"},
//     {"name": "Maharashtra", "image": "assets/images/states/maharashtra.png"},
//     {"name": "Gujarat", "image": "assets/images/states/gujarat.png"},
//     {"name": "Rajasthan", "image": "assets/images/states/rajasthan.png"},
//   ];

//   @override
//   void initState() {
//     super.initState();
//     selectedIndex = 0;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             const SizedBox(height: 60),

//             /// ALPHA TEXT
//             Image.asset("assets/logo.png", height: 90, fit: BoxFit.contain),

//             const SizedBox(height: 4),

//             /// WEBSITE TEXT (between ALPHA and REALITY)
//             const Text(
//               "www.alphareality.in",
//               style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w500,
//                 letterSpacing: 1,
//                 color: Colors.grey,
//               ),
//             ),

//             const SizedBox(height: 20),

//             /// SELECTED STATE NAME (Telangana by default)
//             Text(
//               states[selectedIndex]["name"]!,
//               style: const TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.w700,
//                 letterSpacing: 1,
//                 color: Colors.black,
//               ),
//             ),

//             const SizedBox(height: 40),

//             /// STATES HORIZONTAL LIST
//             SizedBox(
//               height: 140,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 itemCount: states.length,
//                 itemBuilder: (context, index) {
//                   final isSelected = selectedIndex == index;

//                   return GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         selectedIndex = index;
//                       });
//                     },
//                     child: AnimatedContainer(
//                       duration: const Duration(milliseconds: 300),
//                       curve: Curves.easeInOut,
//                       margin: const EdgeInsets.symmetric(horizontal: 12),
//                       padding: const EdgeInsets.all(6),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(6),
//                         border: isSelected
//                             ? Border.all(color: Colors.red, width: 2)
//                             : null,
//                         boxShadow: isSelected
//                             ? [
//                                 BoxShadow(
//                                   color: Colors.red.withOpacity(0.6),
//                                   blurRadius: 12,
//                                   spreadRadius: 2,
//                                 ),
//                               ]
//                             : [],
//                       ),
//                       child: Transform.scale(
//                         scale: isSelected ? 1.2 : 1.0,
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Image.asset(
//                               states[index]["image"]!,
//                               height: 60,
//                               fit: BoxFit.contain,
//                               color: Colors.black,
//                               errorBuilder: (context, error, stackTrace) {
//                                 return Container(
//                                   height: 60,
//                                   width: 60,
//                                   color: Colors.grey[200],
//                                   child: const Center(
//                                     child: Icon(
//                                       Icons.image_not_supported,
//                                       color: Colors.grey,
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                             const SizedBox(height: 8),
//                             if (isSelected)
//                               Text(
//                                 states[index]["name"]!,
//                                 style: const TextStyle(
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),

//             const SizedBox(height: 60),

//             /// LOGIN & SIGNUP BUTTONS - UPDATED STYLING
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 24),
//               child: Row(
//                 children: [
//                   /// LOGIN BUTTON - With rounded corners
//                   Expanded(
//                     child: Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(8),
//                         border: Border.all(color: Colors.black, width: 1.5),
//                       ),
//                       child: TextButton(
//                         onPressed: () {
//                           // TODO: Navigate to Login
//                         },
//                         style: TextButton.styleFrom(
//                           backgroundColor: Colors.white,
//                           padding: const EdgeInsets.symmetric(vertical: 16),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                         ),
//                         child: const Text(
//                           "Login from Mobile",
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.black,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),

//                   const SizedBox(width: 16),

//                   /// SIGNUP BUTTON - With rounded corners and black background
//                   Expanded(
//                     child: Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(8),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.2),
//                             blurRadius: 4,
//                             offset: const Offset(0, 2),
//                           ),
//                         ],
//                       ),
//                       child: TextButton(
//                         onPressed: () {
//                           // TODO: Navigate to Signup
//                         },
//                         style: TextButton.styleFrom(
//                           backgroundColor: Colors.black,
//                           padding: const EdgeInsets.symmetric(vertical: 16),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                         ),
//                         child: const Text(
//                           "Signup",
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 60),
//           ],
//         ),
//       ),
//     );
//   }
// }
