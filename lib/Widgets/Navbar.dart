import 'package:flutter/material.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavItem(icon: Icons.home, label: "Home", isActive: true),
          _NavItem(icon: Icons.favorite, label: "Couple"),
          _NavItem(icon: Icons.person, label: "Profile"),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;

  const _NavItem({
    required this.icon,
    required this.label,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    final activeColor = const Color.fromARGB(255, 144, 66, 216);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: isActive ? activeColor : Colors.grey,
          size: 26,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: isActive ? activeColor : Colors.grey,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
