import 'package:flutter/material.dart';
import 'pages/acceuil.dart'; // <-- importe la page Acceuil

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Couple App',
      home: const Acceuil(), // <-- lance la page Acceuil
    );
  }
}
