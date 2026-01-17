import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _titleAnimation;
  late Animation<double> _subtitleAnimation;
  late Animation<double> _buttonsAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // stagger animations using intervals
    _titleAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.4, curve: Curves.easeOut),
      ),
    );

    _subtitleAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 0.7, curve: Curves.easeOut),
      ),
    );

    _buttonsAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.6, 1.0, curve: Curves.easeOut),
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
              FadeTransition(
                opacity: _titleAnimation,
                child: Container(
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
              ),

              const SizedBox(height: 40),

              // Title
              FadeTransition(
                opacity: _titleAnimation,
                child: const Text(
                  "Married Couples",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: burgundy,
                    letterSpacing: 1.2,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // Subtitle
              FadeTransition(
                opacity: _subtitleAnimation,
                child: Text(
                  "A private space for love, trust and commitment",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: charcoal.withOpacity(0.7),
                  ),
                ),
              ),

              const SizedBox(height: 60),

              // Sign In Button
              FadeTransition(
                opacity: _buttonsAnimation,
                child: SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {},
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
              ),

              const SizedBox(height: 18),

              // Sign Up Button
              FadeTransition(
                opacity: _buttonsAnimation,
                child: SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: OutlinedButton(
                    onPressed: () {},
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
