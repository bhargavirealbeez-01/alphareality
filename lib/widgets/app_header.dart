import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Replace with your actual logo image
          Image.asset(
            'assets/logo.png',
            height: 96,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 96,
                width: 96,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.shield, color: Colors.white, size: 48),
              );
            },
          ),
        ],
      ),
    );
  }
}
