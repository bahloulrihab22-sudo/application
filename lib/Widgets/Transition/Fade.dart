import 'package:flutter/material.dart';

class Fade extends PageRouteBuilder {
  final Widget page;

  Fade({required this.page})
      : super(
          pageBuilder: (_, __, ___) => page,
          transitionDuration: const Duration(milliseconds: 1200),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
}
