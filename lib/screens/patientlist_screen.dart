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
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth <= 600; // Check if the screen is mobile

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: isMobile ? CrossAxisAlignment.start : CrossAxisAlignment.center,
              children: [
                if (!isMobile) ...[
                  // Desktop Layout
                  Align(
                    alignment: Alignment.topRight,
                    child: ElevatedButton(
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
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Patient List",
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontFamily: 'Manjari',
                            ),
                          ),
                          SizedBox(height: 8),
                          Container(
                            width: constraints.maxWidth * 0.8,
                            padding: EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              color: Color(0xFFD3DDE5), // Background color similar to the login screen
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(''),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ] else ...[
                  // Mobile Layout
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context); // Navigate back to the previous screen (LoginScreen)
                        },
                        child: Text('Logout',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Patient",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: 'Manjari',
                          ),
                        ),
                        Text(
                          "List",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: 'Manjari',
                          ),
                        ),
                        ],),
                  SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Color(0xFFD3DDE5), // Background color similar to the login screen
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(''),
                    ),
                  ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}
