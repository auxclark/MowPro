import 'package:flutter/material.dart';
import 'thirdscreen.dart'; // Import the third screen
import 'home_screen.dart';

class IntroScreen2 extends StatefulWidget {
  const IntroScreen2({super.key});

  @override
  _IntroScreen2State createState() => _IntroScreen2State();
}

class _IntroScreen2State extends State<IntroScreen2> {
  int _currentPage = 1; // Update to reflect the second page in sequence

  void _onNextPressed() {
    if (_currentPage < 2) {
      setState(() {
        _currentPage++;
      });
    } else {
      // Navigate to the third screen when reaching the last dot
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ThirdScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // Light background color
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image content
            Image.asset(
              'assets/images/2.png', // Path to the image
              width: 344, // Set width to 344
              height: 344, // Set height to 344
              alignment: Alignment.center, // Align the image in the center
            ),
            const SizedBox(height: 20),

            // Text content
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Efficient, quiet, and autonomous.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 36, // Font size updated to 36px
                  color: Color(0xFF097142), // Text color updated to #097142
                  fontWeight: FontWeight.bold, // Bold font weight
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "The future of lawn maintenance is here.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18, // Font size updated to 18px
                fontStyle: FontStyle.italic, // Italic font style
                fontWeight: FontWeight.w500, // Medium weight
                color: Color(0xFF097142), // Text color updated to #097142
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
                  // Go back to HomeScreen when "SKIP" is pressed
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
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
    );
  }
}
