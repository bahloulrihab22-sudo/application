import 'package:flutter/material.dart';

class Background_white extends StatelessWidget {
  final Widget child;

  const Background_white({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white, // white background
      child: child,
    );
  }
}
