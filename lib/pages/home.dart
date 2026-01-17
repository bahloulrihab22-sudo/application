import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Colors
  static const Color burgundy = Color(0xFF800020);
  static const Color champagne = Color(0xFFF7E7CE);
  static const Color warmWhite = Color(0xFFFAFAFA);
  static const Color charcoal = Color(0xFF2E2E2E);
  static const Color softGold = Color(0xFFC9A24D);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: warmWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Decorative circle
              Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  color: champagne,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: burgundy.withOpacity(0.25),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.favorite,
                  color: Color(0xFF800020),
                  size: 55,
                ),
              ),

              const SizedBox(height: 40),

              // Title
              const Text(
                "Married Couples",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: burgundy,
                  letterSpacing: 1.2,
                ),
              ),

              const SizedBox(height: 12),

              // Subtitle
              Text(
                "A private space for love, trust and commitment",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: charcoal.withOpacity(0.7),
                ),
              ),

              const SizedBox(height: 60),

              // Sign In Button
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: Navigate to Sign In
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: burgundy,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    elevation: 6,
                  ),
                  child: const Text(
                    "Sign In",
                    style: TextStyle(
                      fontSize: 18,
                      color: warmWhite,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 18),

              // Sign Up Button
              SizedBox(
                width: double.infinity,
                height: 55,
                child: OutlinedButton(
                  onPressed: () {
                    // TODO: Navigate to Sign Up
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: softGold, width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 18,
                      color: softGold,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}





