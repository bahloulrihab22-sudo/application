import 'package:flutter/material.dart';
import '../Widgets/Purple_button.dart';
import '../Widgets/White_button.dart';
import '../Widgets/Logo.dart';
import '../Widgets/Transition/Fade.dart';
import '../Widgets/Background_white.dart'; // <- white background
import 'SignIn.dart';
import 'SignUp.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
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

    _slideButtons = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background_white(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              children: [
                const SizedBox(height: 60),

                // Logo
                Logo(width: 160),

                const Spacer(),

                SlideTransition(
                  position: _slideButtons,
                  child: FadeTransition(
                    opacity: _fadeButtons,
                    child: ScaleTransition(
                      scale: _scaleButtons,
                      child: Column(
                        children: [
                          Purple_button(
                            text: "Sign In",
                            onPressed: () {
                              Navigator.push(
                                context,
                                Fade(page: SignIn()),
                              );
                            },
                          ),
                          const SizedBox(height: 16),
                          White_button(
                            text: "Sign Up",
                            onPressed: () {
                              Navigator.push(
                                context,
                                Fade(page: SignUp()),
                              );
                            },
                          ),
                          const SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
