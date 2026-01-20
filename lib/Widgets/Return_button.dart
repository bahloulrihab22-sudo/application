import 'package:flutter/material.dart';

class Return_button extends StatelessWidget {
  final VoidCallback onPressed;

  const Return_button({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: onPressed,
      ),
    );
  }
}
