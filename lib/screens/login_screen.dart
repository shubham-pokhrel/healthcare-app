import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false; // checkbox state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Welcome Back!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Log in to continue",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 32),
              TextField(
                decoration: InputDecoration(
                  labelText: "Username",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: _rememberMe,
                        onChanged: (bool? value) {
                          setState(() {
                            _rememberMe = value ?? false; // Update checkbox state
                          });
                        },
                      ),
                      Text("Remember Me"),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text("Forgot Password?"),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(child: Divider()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text("OR"),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Image.asset('lib/assets/google_icon.png', height: 24),
                label: Text("Sign In Using Google"),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                child: Text("Sign In"),
              ),
              SizedBox(height: 16),
              Text(
                "Don't have an account?",
                textAlign: TextAlign.center,
              ),
              TextButton(
                onPressed: () {},
                child: Text("Sign Up"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
