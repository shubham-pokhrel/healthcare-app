import 'package:flutter/material.dart';

class PatientlistScreen extends StatefulWidget {
  const PatientlistScreen({super.key});

  @override
  State<PatientlistScreen> createState() => _PatientlistScreenState();
}

class _PatientlistScreenState extends State<PatientlistScreen> {
  String? _selectedSortOption;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xE4EBF1F5), // Background color similar to login screen
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth <= 600; // Check if the screen is mobile

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Column(
              crossAxisAlignment: isMobile ? CrossAxisAlignment.start : CrossAxisAlignment.start,
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
                              child: Text('test'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ] else ...[
                  // Mobile Layout
                  
                  Container(
                    color: Color(0xFFD3DDE5),
                    width: constraints.maxWidth,
                    child: Row(
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
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, left: 15.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Patient",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                              fontFamily: 'Manjari',
                            ),
                          ),
                          Text(
                            "List",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                              fontFamily: 'Manjari',
                            ),
                          ),
                          ],),
                  ),
                  //SizedBox(height: 0),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 10.0),
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              
                              ConstrainedBox(
                              constraints: BoxConstraints(
                                maxWidth: constraints.maxWidth * 0.2 > 127 ? 127 : constraints.maxWidth * 0.2,
                              ),
                              // Search Box
                              
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: ('Search'),
                                    prefixIcon: Image.asset(
                                      'lib/assets/search_icon.png',
                                      height: 5,
                                    ),
                                    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                  ),
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Manjari',
                                  ),
                                ),
                              ),
                              SizedBox(width: constraints.maxWidth * 0.1 > 8.0 ? 8.0 : constraints.maxWidth * 0.1),
                              // Sort By dropdown
                              ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxWidth: constraints.maxWidth * 0.3 > 112 ? 112 : constraints.maxWidth * 0.3,
                                ),
                                child: DropdownButtonFormField<String>(
                                value: _selectedSortOption,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                                hint: Text('Sort By:',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Manjari',
                                  ),
                                ),
                                items: <String>['Name', 'Date', 'Status'].map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedSortOption = newValue;
                                  });
                                },
                              ),
                            ),
                              //SizedBox(width: 0),
                              Spacer(),
                              // +Add Button
                              ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxWidth: constraints.maxWidth * 0.02 > 58 ? 58 : constraints.maxWidth * 0.02,
                                ),
                                child: ElevatedButton(
                                  onPressed: () {
                                    // action here
                                  },
                                  
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFF48A9F8), // Blue color similar to the Sign In button
                                    foregroundColor: Colors.white,
                                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Text('+Add',
                                    style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                    fontFamily: 'Manjari',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                  ),
                      
                    
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0, left: 10.0, bottom: 10.0),
                    child: Container(
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
