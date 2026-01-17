import 'package:flutter/material.dart';
import 'home.dart';

class Acceuil extends StatefulWidget {
  const Acceuil({super.key});

  @override
  _AcceuilState createState() => _AcceuilState();
}

class _AcceuilState extends State<Acceuil> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<double> _floatAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3), // Splash duration
    );

    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(begin: 0.3, end: 1.5)
            .chain(CurveTween(curve: Curves.elasticOut)),
        weight: 60,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 1.5, end: 1.2)
            .chain(CurveTween(curve: Curves.easeOutBack)),
        weight: 40,
      ),
    ]).animate(_controller);

    _fadeAnimation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _floatAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0, end: -20), weight: 50),
      TweenSequenceItem(tween: Tween(begin: -20, end: 0), weight: 50),
    ]).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward();

    // Navigate to HomePage after splash animation completes
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => const HomePage(),
            transitionDuration: const Duration(milliseconds: 1200),
            transitionsBuilder: (_, animation, __, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFE6F0),
              Color(0xFFFFC0CB),
            ],
          ),
        ),
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Center(
              child: Opacity(
                opacity: _fadeAnimation.value,
                child: Transform.translate(
                  offset: Offset(0, _floatAnimation.value),
                  child: Transform.scale(
                    scale: _scaleAnimation.value,
                    child: Image.asset(
                      'assets/pigeon.png',
                      width: 280,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
