import 'package:flutter/material.dart';
import '../Widgets/Background_white.dart';
import '../Widgets/Logo.dart';
import '../Widgets/White_button.dart';
import '../Widgets/Return_button.dart';
import '../Widgets/Transition/Fade.dart';
import 'confirm.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _scaleAnimation = Tween<double>(begin: 0.95, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void showMessage(String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        backgroundColor: isError
            ? const Color.fromARGB(255, 98, 76, 138)
            : const Color.fromARGB(255, 144, 66, 216),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background_white(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Return_button(onPressed: () => Navigator.pop(context)),
                  const SizedBox(height: 20),
                  Logo(width: 160),
                  const SizedBox(height: 40),
                  FadeTransition(
                    opacity: _fadeAnimation,
                    child: ScaleTransition(
                      scale: _scaleAnimation,
                      child: Column(
                        children: [
                          TextField(
                            controller: usernameController,
                            decoration: InputDecoration(
                              labelText: "Username",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14)),
                            ),
                          ),
                          const SizedBox(height: 16),
                          TextField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: "Email",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14)),
                            ),
                          ),
                          const SizedBox(height: 16),
                          TextField(
                            controller: passwordController,
                            obscureText: _obscurePassword,
                            decoration: InputDecoration(
                              labelText: "Password",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14)),
                              suffixIcon: IconButton(
                                icon: Icon(_obscurePassword
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _obscurePassword = !_obscurePassword;
                                  });
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          TextField(
                            controller: confirmPasswordController,
                            obscureText: _obscureConfirmPassword,
                            decoration: InputDecoration(
                              labelText: "Confirm Password",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14)),
                              suffixIcon: IconButton(
                                icon: Icon(_obscureConfirmPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _obscureConfirmPassword =
                                        !_obscureConfirmPassword;
                                  });
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          White_button(
                            text: "Confirm",
                            onPressed: () {
                              if (usernameController.text.isEmpty ||
                                  emailController.text.isEmpty ||
                                  passwordController.text.isEmpty ||
                                  confirmPasswordController.text.isEmpty) {
                                showMessage(
                                    "Hey! Tous les champs sont nécessaires ✨",
                                    isError: true);
                                return;
                              }

                              if (passwordController.text !=
                                  confirmPasswordController.text) {
                                showMessage(
                                    "Oops! Les mots de passe ne matchent pas 🔒",
                                    isError: true);
                                return;
                              }

                              showMessage("Bravo! Ton compte est créé 🎉");

                              Future.delayed(
                                const Duration(milliseconds: 500),
                                () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const Confirm(),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                          const SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
