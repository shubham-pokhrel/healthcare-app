import 'package:flutter/material.dart';

class PatientlistScreen extends StatefulWidget {
  const PatientlistScreen({super.key});

  @override
  State<PatientlistScreen> createState() => _PatientlistScreenState();
}

class _PatientlistScreenState extends State<PatientlistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xE4EBF1F5), // Background color similar to login screen
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Your patient list content can go here
            Text('Patient List Page Content Here'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Navigate back to the previous screen (LoginScreen)
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF48A9F8), // Blue color similar to the Sign In button
                foregroundColor: Colors.white, // White text color
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
