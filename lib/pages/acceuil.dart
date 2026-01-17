import 'package:flutter/material.dart';

class Acceuil extends StatefulWidget {
  const Acceuil({super.key});

  @override
  _AcceuilState createState() => _AcceuilState();
}

class _AcceuilState extends State<Acceuil> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _floatAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // Animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // Float animation: from -50 (start above) to 0 (final position)
    _floatAnimation = Tween<double>(begin: -50, end: 0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );

    // Optional: slight scale bounce while landing
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticOut),
    );

    // Start animation
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
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFFFFBFB), // soft white
              Color(0xFFFFC0CB), // soft pink
            ],
          ),
        ),
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Center(
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
            );
          },
        ),
      ),
    );
  }
}
