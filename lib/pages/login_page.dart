import 'package:camer_meals/pages/home_page.dart';
import 'package:camer_meals/widget/button_bar.dart';
import 'package:flutter/material.dart';

// Import AuthService

class LoginPage extends StatefulWidget{
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() {
  return _LoginPageState();
  }

}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _continue() {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      // Display an error message if fields are empty
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter both email and password'),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      // Navigate to the next page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }
  }

  void _continueWithGoogle() {
    // Simulate Google sign-in
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Signed in with Google'),
        backgroundColor: Colors.green,
      ),
    );
    // Navigate to the next page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  void _continueWithFacebook() {
    // Simulate Facebook sign-in
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Signed in with Facebook'),
        backgroundColor: Colors.blue,
      ),
    );
    // Navigate to the next page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  void _continueWithApple() {
    // Simulate Apple sign-in
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Signed in with Apple'),
        backgroundColor: Colors.black,
      ),
    );
    // Navigate to the next page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  void _signUp() {
  // Navigate to the sign-up page
  Navigator.pushNamed(context, '/signup');
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
                  height: 100, 
                  // Adjust the size as needed
                ),
              ),
              const SizedBox(height: 20), // Reduced spacing
              // Welcome Back Text
              const Text(
                "Welcome Back",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Updated to white for visibility on black background
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              // Enter Your Detail Text
              const Text(
                "Enter Your Detail",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white, // Updated to white for visibility on black background
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
              // Continue Button
              TextButton(
                onPressed: _continue,
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
                  "Continue",
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
              // Continue with Google Button
              GestureDetector(
                onTap: _continueWithGoogle,
                child: const SocialButton(
                  text: "Continue with Google",
                  imagePath: 'lib/pages/assets/search.png', // Corrected asset path
                ),
              ),
              const SizedBox(height: 16), // Reduced spacing
              // Continue with Facebook Button
              GestureDetector(
                onTap: _continueWithFacebook,
                child: const SocialButton(
                  text: "Continue with Facebook",
                  imagePath: 'lib/pages/assets/facebook.png', // Corrected asset path
                ),
              ),
              const SizedBox(height: 16), // Reduced spacing
              // Continue with Apple Button
              GestureDetector(
                onTap: _continueWithApple,
                child: const SocialButton(
                  text: "Continue with Apple",
                  imagePath: 'lib/pages/assets/apple-logo.png', // Corrected asset path
                ),
              ),
              const SizedBox(height: 24), // Reduced spacing
              // Sign Up Section
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: _signUp,
                    child: const Text(
                      "Create accont",
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



// Placeholder for the sign-up page
class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: const Center(
        child: Text("Sign-Up Page"),
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  final String text;
  final String imagePath;

  const SocialButton({
    super.key,
    required this.text,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 13), // Reduced padding
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            height: 24,
            width: 24,
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}