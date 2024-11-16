import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'secondscreen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int _currentPage = 0;
  final int _totalPages = 3;

  void _goToNextPage() {
    setState(() {
      if (_currentPage < _totalPages - 1) {
        _currentPage++;
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const IntroScreen2()),
        );
      }
    });
  }

  Widget _buildDot(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: _currentPage == index ? 24.0 : 8.0,
      decoration: BoxDecoration(
        color: _currentPage == index ? const Color(0xFF097142) : Colors.grey,
        borderRadius: BorderRadius.circular(4.0),
      ),
    );
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
              'assets/images/1.png', // Path to the image
              width: 344, // Set width to 344
              height: 344, // Set height to 344
              alignment: Alignment.center, // Align the image in the center
            ),
            const SizedBox(height: 20),

            // Text content
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "The smarter way to a flawless yard.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 36, // Font size updated to 36px
                  color: Color(0xFF097142),
                  fontWeight: FontWeight.bold, // Bold font weight
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Lawn care that works while you relax.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18, // Font size updated to 18px
                fontStyle: FontStyle.italic, // Italic font style
                fontWeight: FontWeight.w500, // Medium weight
                color: Color(0xFF097142),
                fontFamily: 'Montserrat',
              ),
            ),

            const SizedBox(height: 30),

            // Dot Indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_totalPages, (index) => _buildDot(index)),
            ),

            const SizedBox(height: 30),

            // "Next" button
            SizedBox(
              width: 302, // Adjusted width
              height: 50,
              child: ElevatedButton(
                onPressed: _goToNextPage,
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
