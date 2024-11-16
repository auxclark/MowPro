import 'package:flutter/material.dart';
import 'package:smartmower/secondscreen.dart';
import 'fourthscreen.dart'; // Import the Fourthscreen (dashboard or main screen).

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  int _currentPage = 2; // This represents the third screen

  void _onNextPressed() {
    // Navigate to Fourthscreen (dashboard or main screen)
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Fourthscreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // Light background color
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:
                CrossAxisAlignment.center, // Center horizontally
            children: [
              // Image content
              Image.asset(
                'assets/images/4.png', // Path to the image
                width: 344, // Set width to 344
                height: 344, // Set height to 344
              ),
              const SizedBox(height: 20),

              // Text content
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Lawn mow itself',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF097142), // Text color updated to #097142
                    fontSize: 36, // Font size updated to 36px
                    fontWeight: FontWeight.bold, // Bold font weight
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'that takes lawn care your hands.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF097142), // Text color updated to #097142
                  fontSize: 18, // Font size updated to 18px
                  fontStyle: FontStyle.italic, // Italic font style
                  fontWeight: FontWeight.w500, // Medium weight
                  fontFamily: 'Montserrat',
                ),
              ),
              const SizedBox(height: 20),

              // Dot indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentPage == 0
                          ? const Color(0xFF097142)
                          : const Color(0xFFB5E0C5),
                    ),
                  ),
                  Container(
                    width: 20,
                    height: 10,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: _currentPage == 1
                          ? const Color(0xFF097142)
                          : const Color(0xFFB5E0C5),
                    ),
                  ),
                  Container(
                    width: 20,
                    height: 10,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: _currentPage == 2
                          ? const Color(0xFF097142)
                          : const Color(0xFFB5E0C5),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),

              // "Next" button
              SizedBox(
                width: 302, // Adjusted width
                height: 50,
                child: ElevatedButton(
                  onPressed: _onNextPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00A85B), // Updated color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15), // Updated radius
                    ),
                  ),
                  child: const Text(
                    "NEXT",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // "Skip" button
              SizedBox(
                width: 302, // Adjusted width
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // Go back to IntroScreen2 when "SKIP" is pressed
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const IntroScreen2()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00A85B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    "SKIP",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
