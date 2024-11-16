import 'package:flutter/material.dart';
import 'controller.dart';

class WithoutSigninScreen extends StatefulWidget {
  const WithoutSigninScreen({super.key});

  @override
  _WithoutSigninScreen createState() => _WithoutSigninScreen();
}

class _WithoutSigninScreen extends State<WithoutSigninScreen> {
  int _currentPage = 3; // Represents the fourth screen

  void _onOpenDashboardPressed() {
    // Navigate to DashboardScreen when "OPEN DASHBOARD" is pressed
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => JoystickController()),
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
              'assets/images/controller.png', // Path to the image
              width: 344, // Set width to 344
              height: 344, // Set height to 344
              alignment: Alignment.center, // Align the image in the center
            ),
            const SizedBox(height: 20),

            // Text content
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Welcome to MowPro.',
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
              'Simplify your lawn care journey and take control like a pro!',
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
                Container(
                  width: 20,
                  height: 10,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: _currentPage == 3
                        ? const Color(0xFF097142)
                        : const Color(0xFFB5E0C5),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),

            // "Open Dashboard" button
            SizedBox(
              width: 302, // Adjusted width
              height: 50,
              child: ElevatedButton(
                onPressed: _onOpenDashboardPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00A85B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15), // Updated radius
                  ),
                ),
                child: const Text(
                  'OPEN CONTROLLER',
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
