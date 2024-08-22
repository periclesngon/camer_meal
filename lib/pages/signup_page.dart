import 'package:flutter/material.dart';

// Import AuthService

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SignUpPageState();
  }
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  void _signUp() {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    String confirmPassword = _confirmPasswordController.text.trim();

    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all fields'),
          backgroundColor: Colors.red,
        ),
      );
    } else if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Passwords do not match'),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Successfully signed up!'),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pushReplacementNamed(context, '/next');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Logo at the top center
              Center(
                child: Image.asset(
                  'lib/pages/assets/camerlogo.png', // Replace with your logo path
                  height: 100, // Adjust the size as needed
                ),
              ),
              const SizedBox(height: 20), // Reduced spacing
              // Welcome to Sign Up Text
              const Text(
                "Create an Account",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Updated to white for visibility on black background
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              const Text(
                "Enter your details below",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20), // Reduced spacing
              // Email TextField
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 6), // Reduced padding
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16), // Increased curves by 30%
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: "Enter your Email",
                    hintStyle: TextStyle(
                      color: Colors.black.withOpacity(0.25),
                    ),
                    border: InputBorder.none,
                  ),
                  style: const TextStyle(color: Colors.black),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              const SizedBox(height: 16), // Reduced spacing
              // Password TextField
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 6), // Reduced padding
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16), // Increased curves by 30%
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: TextStyle(
                      color: Colors.black.withOpacity(0.25),
                    ),
                    border: InputBorder.none,
                  ),
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(height: 16), // Reduced spacing
              // Confirm Password TextField
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 6), // Reduced padding
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16), // Increased curves by 30%
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: TextField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Confirm Password",
                    hintStyle: TextStyle(
                      color: Colors.black.withOpacity(0.25),
                    ),
                    border: InputBorder.none,
                  ),
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(height: 16), // Reduced spacing
              // Sign Up Button
              TextButton(
                onPressed: _signUp,
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 13),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16), // Increased curves by 30%
                  ),
                  shadowColor: Colors.grey.withOpacity(0.5),
                  elevation: 4,
                ),
                child: const Text(
                  "Sign Up",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 24), // Reduced spacing
              // OR Separator
              const Row(
                children: [
                  Expanded(child: Divider(color: Colors.white)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "OR",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Expanded(child: Divider(color: Colors.white)),
                ],
              ),
              const SizedBox(height: 20), // Reduced spacing
              // Already have an account? Sign in
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/');
                    },
                    child: const Text(
                      "Sign In",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Other pages (LoginPage, NextPage, SocialButton) go here...
