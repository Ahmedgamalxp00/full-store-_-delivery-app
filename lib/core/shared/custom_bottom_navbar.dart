import 'package:delivery_app/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class CustomBottmNavBar extends StatelessWidget {
  const CustomBottmNavBar({
    super.key,
    this.onTabChange,
    required this.selectedIndx,
  });
  final Function(int)? onTabChange;
  final int selectedIndx;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: GNav(
            selectedIndex: selectedIndx,
            tabBackgroundColor: kPrimeryColor.withOpacity(0.2),
            activeColor: kPrimeryColor,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            gap: 10,
            onTabChange: onTabChange,
            tabs: const [
              GButton(
                icon: Icons.home_filled,
                text: 'Home',
              ),
              GButton(
                icon: Icons.shopping_cart_rounded,
                text: 'Accepted',
              ),
              // GButton(
              //   icon: Icons.archive,
              //   text: 'Archived',
              // ),
              GButton(
                icon: Icons.settings,
                text: 'Setting',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
