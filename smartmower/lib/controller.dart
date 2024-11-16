import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class JoystickController extends StatelessWidget {
  const JoystickController({Key? key}) : super(key: key);

  Future<void> scanForSpecificBluetoothDevice(BuildContext context) async {
    try {
      print("Starting Bluetooth scan...");

      // Start scanning for Bluetooth devices
      FlutterBluePlus.startScan(timeout: const Duration(seconds: 10));

      // The MAC address of the Bluetooth module you want to scan for
      String targetDeviceId = "98:09:71:05:97:DA"; // Your device's MAC address
      String targetDeviceName = "JDY-31-SPP"; // Your device's name

      List<ScanResult> devices = [];

      await for (List<ScanResult> scanResults in FlutterBluePlus.scanResults) {
        // Filter the scan results by device ID (MAC address) and device name
        for (var result in scanResults) {
          if (result.device.id.toString() == targetDeviceId ||
              result.device.name == targetDeviceName) {
            print(
                "Found target device: ${result.device.name}, ID: ${result.device.id}");
            devices.add(result); // Add the specific device to the list
          }
        }
      }

      // Show the specific device in a dialog if found
      if (devices.isNotEmpty) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Available Device'),
            content: SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: devices.length,
                itemBuilder: (context, index) {
                  final result = devices[index];
                  return ListTile(
                    title: Text(result.device.name.isEmpty
                        ? 'Unknown Device'
                        : result.device.name),
                    subtitle: Text(result.device.id.toString()),
                    onTap: () {
                      FlutterBluePlus.stopScan();
                      Navigator.pop(context);
                      print('Selected: ${result.device.name}');
                    },
                  );
                },
              ),
            ),
          ),
        );
      } else {
        print("No matching Bluetooth device found.");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No devices found.')),
        );
      }

      // Stop scanning after use
      FlutterBluePlus.stopScan();
    } catch (e) {
      print("Error during Bluetooth scan: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error during scan: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text("MowPro Controller"),
        backgroundColor: const Color(0xFFF5F5F5),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 1),
          // Bluetooth Button
          SizedBox(
            width: 264,
            height: 69.37,
            child: ElevatedButton.icon(
              onPressed: () => scanForSpecificBluetoothDevice(
                  context), // Use the correct method
              icon: const Icon(Icons.bluetooth, color: Colors.white),
              label: const Text(
                "Connect to GS-Mower",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00A85B),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                color: const Color(0xFF00A85B),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    offset: const Offset(4, 4),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () => print("Up Pressed"),
                    icon: const Icon(Icons.arrow_drop_up, size: 50),
                    color: Colors.white,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () => print("Left Pressed"),
                        icon: const Icon(Icons.arrow_left, size: 50),
                        color: Colors.white,
                      ),
                      ElevatedButton(
                        onPressed: () => print("Stop Pressed"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(24),
                        ),
                        child: const Text(
                          "S",
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      ),
                      IconButton(
                        onPressed: () => print("Right Pressed"),
                        icon: const Icon(Icons.arrow_right, size: 50),
                        color: Colors.white,
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () => print("Down Pressed"),
                    icon: const Icon(Icons.arrow_drop_down, size: 50),
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          const Spacer(flex: 1),
        ],
      ),
    );
  }
}

void main() => runApp(const MaterialApp(home: JoystickController()));
