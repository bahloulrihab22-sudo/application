import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final double width;

  const Logo({
    super.key,
    this.width = 160,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'logoHero',
      child: Image.asset(
        'assets/pigeon.png',
        width: width,
      ),
    );
  }
}
