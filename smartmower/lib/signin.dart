import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'home_screen.dart';
import 'signup.dart';
import 'without_signin.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _isPasswordVisible = false;
  bool _isButtonPressed = false;

  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);
        if (userCredential.user != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        }
      }
    } catch (e) {
      print("Google Sign-In error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFfcfcf7),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 70),
              Padding(
                padding: EdgeInsets.only(left: 35),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Welcome Back!",
                    style: TextStyle(
                      fontSize: 36,
                      color: Color(0xFF00A85B),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 4.5),
              Padding(
                padding: EdgeInsets.only(left: 35),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Sign in to your account.",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF848080),
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFF2F2ED),
                          labelText: "Email",
                          labelStyle: TextStyle(
                              color: Color(0xFF848080),
                              fontFamily: 'Montserrat'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon:
                              Icon(Icons.email, color: Color(0xFF848080)),
                          contentPadding: EdgeInsets.symmetric(vertical: 16),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      child: TextField(
                        obscureText: !_isPasswordVisible,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFF2F2ED),
                          labelText: "Password",
                          labelStyle: TextStyle(
                              color: Color(0xFF848080),
                              fontFamily: 'Montserrat'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon:
                              Icon(Icons.lock, color: Color(0xFF848080)),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Color(0xFF848080),
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 16),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTapDown: (_) {
                        setState(() => _isButtonPressed = true);
                      },
                      onTapUp: (_) {
                        setState(() => _isButtonPressed = false);
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 100),
                        width: double.infinity,
                        height: _isButtonPressed ? 58 : 60,
                        child: ElevatedButton(
                          onPressed: () {
                            // Handle sign-in logic here
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF00A85B),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: const Text(
                            "Sign In",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          // Handle forgot password logic
                        },
                        child: const Text(
                          "Forgot Password",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF848080),
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const WithoutSigninScreen()),
                          );
                        },
                        child: const Text(
                          "Proceed without signing in.",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF00A85B),
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 60,
                    height: 60,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        _signInWithGoogle(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF2F2ED),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: const BorderSide(color: Color(0xFFF2F2ED)),
                        ),
                        elevation: 0,
                      ),
                      icon: Image.asset(
                        'assets/images/google_icon.png',
                        width: 24,
                        height: 24,
                      ),
                      label: const Text(
                        'Google',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 60,
                    height: 60,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Handle Facebook Sign-In
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF2F2ED),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: const BorderSide(color: Color(0xFFF2F2ED)),
                        ),
                        elevation: 0,
                      ),
                      icon: Image.asset(
                        'assets/images/facebook_icon.png',
                        width: 24,
                        height: 24,
                      ),
                      label: const Text(
                        'Facebook',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 13),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(fontSize: 16, fontFamily: 'Montserrat'),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpScreen()),
                      );
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF00A85B),
                        fontFamily: 'Montserrat',
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
