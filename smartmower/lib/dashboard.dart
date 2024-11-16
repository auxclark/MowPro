import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lawn Mower App',
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(333, 62),
        child: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {},
          ),
          backgroundColor: Color(0xFF00A85B),
          centerTitle: true,
          title: SizedBox(
            width: 333,
            child: Center(),
          ),
          elevation: 0,
          actions: [
            IconButton(icon: Icon(Icons.lightbulb_outline), onPressed: () {}),
            IconButton(icon: Icon(Icons.settings), onPressed: () {}),
            IconButton(icon: Icon(Icons.info_outline), onPressed: () {}),
          ],
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 232, 245, 239),
              const Color.fromARGB(255, 239, 251, 250)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 60), // Space for AppBar
            Image.asset(
              '', // Replace with your image asset path
              height: 200,
            ),
            SizedBox(height: 10),
            Text(
              'CHEETAH 127 CC',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[800]),
            ),
            SizedBox(height: 20),
            Text(
              'ACCURACY',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[700]),
            ),
            SizedBox(height: 20),
            AccuracyIndicator(label: 'Coverage Area Accuracy', value: 0.8),
            AccuracyIndicator(
                label: 'Cutting Precision and Uniformity', value: 0.59),
            AccuracyIndicator(
                label: 'Obstacle Detection Accuracy', value: 0.89),
            AccuracyIndicator(label: 'Path Following Accuracy', value: 0.5),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Container(
            width: 333, // Set the width
            height: 62, // Set the height
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15), // Border radius
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, -5),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                  15), // Apply the same border radius here
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 16.0), // Add space on left and right
                child: BottomNavigationBar(
                  items: [
                    BottomNavigationBarItem(
                      icon: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          Color(
                              0xFFFCFCF7), // Desired color overlay for the image
                          BlendMode.srcIn,
                        ),
                        child: Image.asset(
                          'assets/images/home.png',
                          width: 24,
                          height: 24,
                        ),
                      ),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          Color(0xFFFCFCF7),
                          BlendMode.srcIn,
                        ),
                        child: Image.asset(
                          'assets/images/notification.png',
                          width: 24,
                          height: 24,
                        ),
                      ),
                      label: 'Notification',
                    ),
                    BottomNavigationBarItem(
                      icon: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          Color(0xFFFCFCF7),
                          BlendMode.srcIn,
                        ),
                        child: Image.asset(
                          'assets/images/statistic.png',
                          width: 24,
                          height: 24,
                        ),
                      ),
                      label: 'Statistics',
                    ),
                    BottomNavigationBarItem(
                      icon: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          Color(0xFFFCFCF7),
                          BlendMode.srcIn,
                        ),
                        child: Image.asset(
                          'assets/images/location.png',
                          width: 24,
                          height: 24,
                        ),
                      ),
                      label: 'Location',
                    ),
                  ],
                  selectedItemColor: Color(0xFFFCFCF7),
                  unselectedItemColor: Color(0xFFFCFCF7),
                  selectedLabelStyle: TextStyle(
                    color: Color(0xFFFCFCF7),
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700, // Bold
                  ),
                  unselectedLabelStyle: TextStyle(
                    color: Color(0xFFFCFCF7),
                    fontFamily: 'Montserrat',
                  ),
                  backgroundColor: Color(0xFF00A85B),
                  type: BottomNavigationBarType.fixed,
                ),
              ),
            ),
          )),
    );
  }
}

class AccuracyIndicator extends StatelessWidget {
  final String label;
  final double value;

  AccuracyIndicator({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(color: Colors.green[700])),
          SizedBox(height: 4),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: value,
              minHeight: 10,
              backgroundColor: Colors.green[100],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
            ),
          ),
          SizedBox(height: 5),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              '${(value * 100).toInt()}%',
              style: TextStyle(
                  color: Colors.green[700], fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
