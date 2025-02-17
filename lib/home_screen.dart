import 'package:demo_app/main.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        automaticallyImplyLeading: false,
        actions: [
          // Logout Button in the top right corner
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Navigate back to the OtpVerificationScreen when logged out
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const OtpVerificationScreen()),
              );
            },
          ),
        ],
      ),
      body: const Center(
        child: Text(
          "Welcome to the Home Screen!",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
