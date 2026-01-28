import 'package:flutter/material.dart';

class Background_pink extends StatelessWidget {
  final Widget child;

  const Background_pink({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: child,
    );
  }
}
