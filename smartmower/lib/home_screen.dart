import 'package:flutter/material.dart';
import 'dart:developer';
import 'firstscreen.dart'; 
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Centers the column content
          children: [
            // Add top padding for the logo
            Padding(
              padding: const EdgeInsets.only(
                  top: 300.0), // Adjust the top padding here
              child: Image.asset(
                'assets/images/logo.png',
                height: 150, // Size of the logo
              ),
            ),
            const SizedBox(height: 150), // Space between logo and button

            // Get Started Button
            SizedBox(
              width: 300, // Width of the button
              height: 60, // Height of the button
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00A85B), // Background color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15), // Border radius
                  ),
                  shadowColor: Colors.black
                      .withOpacity(0.25), // Shadow color and opacity
                  elevation: 5, // Elevation for 3D effect
                ),
                onPressed: () {
                  log('Get Started Pressed');
                  // Navigate to ControllerScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => IntroScreen(),
                    ),
                  );
                },
                child: const Text(
                  'GET STARTED',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
