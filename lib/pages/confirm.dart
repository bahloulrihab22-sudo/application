import 'package:flutter/material.dart';
import '../Widgets/Background_white.dart';
import '../Widgets/Logo.dart';
import '../Widgets/Navbar.dart';

class Confirm extends StatelessWidget {
  const Confirm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background_white(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 40),

              // Logo
              Logo(width: 180),

              const SizedBox(height: 40),

              // Main content
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.favorite,
                      color: Color.fromARGB(255, 144, 66, 216),
                      size: 80,
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Compte confirmé 💕",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 12),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32),
                      child: Text(
                        "Bienvenue dans votre espace couple.\nConstruisez, partagez et grandissez ensemble ✨",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),

              // Footer navbar
              const BottomNavbar(),
            ],
          ),
        ),
      ),
    );
  }
}
