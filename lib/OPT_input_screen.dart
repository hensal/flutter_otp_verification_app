import 'package:flutter/material.dart';
import 'package:demo_app/home_screen.dart';

class OtpInputScreen extends StatefulWidget {
  final String otp;

  const OtpInputScreen({super.key, required this.otp});

  @override
  // ignore: library_private_types_in_public_api
  _OtpInputScreenState createState() => _OtpInputScreenState();
}

class _OtpInputScreenState extends State<OtpInputScreen> {
  final TextEditingController _otpController = TextEditingController();
  String? _errorMessage;  // Variable to hold error message

  // Verify OTP
  void verifyOtp() {
    if (_otpController.text == widget.otp) {
      // OTP is correct, navigate to home screen
      print("OTP Verified Successfully!");
      
      // Navigate to the HomeScreen (replace current screen)
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      // Incorrect OTP, show error message
      setState(() {
        _errorMessage = "Incorrect OTP. Please try again.";  // Update error message
      });
      print("Incorrect OTP");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Enter OTP")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              const Text(
                "Enter the OTP sent to your mobile",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              // OTP Input Field
              TextField(
                controller: _otpController,
                decoration: const InputDecoration(
                  labelText: 'Enter OTP',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                maxLength: 6,
              ),
              const SizedBox(height: 20),

              // Show error message if OTP is incorrect
              if (_errorMessage != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    _errorMessage!,
                    style: const TextStyle(color: Colors.red, fontSize: 14),
                  ),
                ),

              // Verify OTP Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: verifyOtp,
                  child: const Text(
                    "Verify OTP",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
