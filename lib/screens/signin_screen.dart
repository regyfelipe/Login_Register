import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:login/routes/routes.dart';
import '../utils/validators.dart';
import '../widgets/input_field.dart';
import '../widgets/social_button.dart';
import 'package:google_fonts/google_fonts.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final _formKey = GlobalKey<FormState>(); 
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 60),
                const SizedBox(
                  width: 80,
                  height: 80,
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage('assets/logo.png'),
                  ),
                ),
                const SizedBox(height: 40),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Sign in',
                    style: GoogleFonts.quicksand(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                InputField(
                  label: 'Email',
                  hint: 'Your email',
                  validator: Validators.validateEmail,
                  onChanged: (value) => email = value,
                ),
                const SizedBox(height: 20),
                InputField(
                  label: 'Password',
                  hint: 'Enter your password',
                  isPassword: true,
                  validator: Validators.validatePassword, 
                  onChanged: (value) => password = value,
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print('Email: $email, Password: $password'); 
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: const Center(
                      child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )),
                ),
                const SizedBox(height: 20),
                const Text('Or Register with',
                    style: TextStyle(color: Colors.black54)),
                const SizedBox(height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SocialButton(
                      icon: BootstrapIcons.facebook,
                      color: Colors.blue,
                    ),
                    SocialButton(
                      icon: BootstrapIcons.google,
                      color: Colors.red,
                    ),
                    SocialButton(
                      icon: BootstrapIcons.apple,
                      color: Colors.black,
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?",
                        style: TextStyle(color: Colors.black54)),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.signup);
                      },
                      child: const Text('Sign up',
                          style: TextStyle(color: Colors.black)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
