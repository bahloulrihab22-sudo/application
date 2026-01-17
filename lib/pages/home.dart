import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeButtons;
  late Animation<double> _scaleButtons;
  late Animation<Offset> _slideButtons;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _fadeButtons = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );
    _scaleButtons = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );
    _slideButtons =
        Tween<Offset>(begin: const Offset(0, 0.2), end: Offset.zero).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  static const Color primaryColor = Color(0xFFFF90B0);
  static const Color backgroundColor = Color(0xFFFFFBFC);
  static const Color textColor = Color(0xFF555555);
  static const Color accentColor = Color(0xFFFF97AD);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            children: [
              const SizedBox(height: 60), // espace avant logo
              Hero(
                tag: 'logoHero',
                child: Image.asset(
                  'assets/pigeon.png',
                  width: 160,
                  height: 160,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 60), // espace entre logo et boutons

              // boutons au milieu
              SlideTransition(
                position: _slideButtons,
                child: FadeTransition(
                  opacity: _fadeButtons,
                  child: ScaleTransition(
                    scale: _scaleButtons,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 55,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            child: const Text(
                              "Sign In",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: backgroundColor,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          height: 55,
                          child: OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: accentColor, width: 2),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14)),
                            ),
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: accentColor,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const Spacer(), // pousse tout le reste en bas (si besoin)
            ],
          ),
        ),
      ),
    );
  }
}
