import 'package:flutter/material.dart';
import 'screens/login_screen.dart'; 

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Patient Management App',
      theme: ThemeData(
        primarySwatch: Colors.blue,  // seting global app styling
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginScreen(),  
      debugShowCheckedModeBanner: false, // Remove debug banner
    );
  }
}
