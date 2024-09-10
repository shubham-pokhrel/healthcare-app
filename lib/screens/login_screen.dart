import 'package:flutter/material.dart';
import 'package:healthcare/screens/patientlist_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;
  ThemeMode _themeMode = ThemeMode.light; // Track theme mode

  void _toggleTheme(bool isChecked) {
    setState(() {
      _rememberMe = isChecked;
      _themeMode = isChecked ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _themeMode == ThemeMode.dark ? Color(0xFF38414B) : Color(0xFFE4EBF1), // #background: #E4EBF1F5;Light background color for the page
      //_themeMode == ThemeMode.dark ? Color(0xFF38414B) : Color(0xFFE4EBF1), //background: #38414B;

      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            bool isMobile = constraints.maxWidth <= 600; // Check if the screen is mobile
            double containerWidth = isMobile ? constraints.maxWidth : ((constraints.maxWidth * 0.55) > 801 ? 801: constraints.maxWidth * 0.55);
            double containerHeight = isMobile ? ((constraints.maxHeight * 0.42) > 405 ? 405 : (constraints.maxHeight * 0.42)) : 500;

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: isMobile
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.center,
                children: [
                  if (isMobile) ...[
                    // Mobile Layout
                    Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 48,
                              height: 1,
                              fontWeight: FontWeight.w700,
                              color: _themeMode == ThemeMode.dark ? Colors.white : Colors.black,
                              fontFamily: 'Manjari',
                            ),
                          ),
                          Text(
                            "Back!",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 48,
                              height: 1,
                              fontWeight: FontWeight.bold,
                              color: _themeMode == ThemeMode.dark ? Colors.white : Colors.black,
                              fontFamily: 'Manjari',
                            ),
                          ),
                          //SizedBox(height: 0),
                          Text(
                            "Log in to continue",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 14,
                              height: 1,
                              color: _themeMode == ThemeMode.dark ? Colors.white : Colors.black,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Manjari',
                            ),
                          ),
                          SizedBox(height: 8),
                        ],
                      ),
                    ),
                  ] else ...[
                    // Desktop Layout
                    Text(
                      "Welcome Back!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: _themeMode == ThemeMode.dark ? Colors.white : Colors.black,
                        fontFamily: 'Manjari',
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Log in to continue",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: _themeMode == ThemeMode.dark ? Colors.white : Colors.black,
                        fontFamily: 'Manjari',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 32),
                  ],
                  // Box containing the form elements
                  Container(
                    width: containerWidth,
                    //height: containerHeight,
                    // constraints: BoxConstraints(
                    //   maxHeight: containerHeight,
                    // ),
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: _themeMode == ThemeMode.dark ? Color(0xFF45515F) : Color(0xFFD3D8DE), // background: #D3D8DE; Light grey background color background: #45515F;

                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Username Input
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Username",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: _themeMode == ThemeMode.dark ? Colors.white : Colors.black,
                                  fontFamily: 'Manjari',
                                ),
                              ),
                              SizedBox(height: 8),
                              TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16),
                        // Password Input
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Password",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: _themeMode == ThemeMode.dark ? Colors.white : Colors.black,
                                fontFamily: 'Manjari',
                              ),
                            ),
                            SizedBox(height: 8),
                            TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 12),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 0),
                        // Remember Me and Forgot Password
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: _rememberMe,
                                  onChanged: (bool? value) {
                                     _toggleTheme(value ?? false);
                                    setState(() {
                                      _rememberMe = value ?? false;
                                    });
                                  },
                                ),
                                Text(
                                  "Remember Me",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: _themeMode == ThemeMode.dark ? Colors.white : Colors.black,
                                    fontFamily: 'Manjari',
                                  ),
                                ),
                              ],
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontFamily: 'Manjari',
                                  decoration: TextDecoration.underline,
                                decorationColor: Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        // OR Divider
                        Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: _themeMode == ThemeMode.dark ? Colors.white : Colors.black,
                                thickness: 1,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                "OR",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: _themeMode == ThemeMode.dark ? Colors.white : Colors.black,
                                  fontFamily: 'Manjari',
                                ),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                color: _themeMode == ThemeMode.dark ? Colors.white : Colors.black,
                                thickness: 1,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        // Google Sign In Button
                        Align(
                          alignment: Alignment.center,
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              double buttonWidth = constraints.maxWidth * 0.602 > 220 ? 220 : constraints.maxWidth * 0.602;
                              //if (buttonWidth > 260) buttonWidth = 260;
                              double buttonHeight =  constraints.maxWidth > 600 ? 52 : 30;

                              return SizedBox(
                                width: buttonWidth,
                                height: buttonHeight,
                                child: OutlinedButton.icon(
                                  onPressed: () {},
                                  icon: Image.asset(
                                    'lib/assets/google_icon.png',
                                    height: buttonHeight * 0.9,
                                  ),
                                  label: Text(
                                    "Sign In Using Google",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: _themeMode == ThemeMode.dark ? Colors.white : Colors.black,
                                      fontFamily: 'Manjari',
                                    ),
                                  ),
                                  style: OutlinedButton.styleFrom(
                                    side: BorderSide(
                                        color: Color(0xFF48A9F8), width: 1),
                                    foregroundColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 16),
                        // Sign In Button
                        Align(
                          alignment: Alignment.center,
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              double buttonWidth = constraints.maxWidth * 0.22;
                              double buttonHeight =
                                  constraints.maxWidth > 600 ? 45 : 40;
                              if (buttonWidth > 140) buttonWidth = 140;

                              return SizedBox(
                                width: buttonWidth,
                                height: buttonHeight,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>  PatientlistScreen(themeMode: _themeMode, ThemeMode: _themeMode,)),
                                    );
                                  },
                                  child: Text(
                                    "Sign In",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Manjari',
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: Color(0xFF48A9F8),
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 7),
                  // Sign Up Text Outside the Box
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Don't have an account?",
                          
                            style: TextStyle(
                              fontSize: 14,
                              color: _themeMode == ThemeMode.dark ? Colors.white : Colors.black,
                              fontFamily: 'Manjari',
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.blue,
                                fontFamily: 'Manjari',

                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
