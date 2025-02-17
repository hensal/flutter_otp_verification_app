import 'package:demo_app/OPT_input_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const OtpVerificationScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OtpVerificationScreenState createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  String? phoneNumber;
  final TextEditingController _phoneController = TextEditingController();

  // Send OTP to the phone number
  Future<void> sendOtp() async {
    final url = Uri.parse('http://localhost:3000/send-otp');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'phoneNumber': phoneNumber}),
    );

    if (response.statusCode == 200) {
      // Handle OTP sent successfully
      final data = json.decode(response.body);
      String otp = data['otp'].toString(); // Convert OTP to String
      print('OTP sent: $otp'); // Now it's a string
      print('OTP sent: ${data['otp']}');

      // Navigate to OTP input screen and pass the OTP
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OtpInputScreen(otp: otp),
        ),
      );
    } else {
      // Handle failure
      print('Failed to send OTP');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "OTP Verification",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "We will send you an One Time Password on this mobile number",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 20),

              // Phone Number Input Field
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IntlPhoneField(
                  controller: _phoneController,
                  decoration: const InputDecoration(
                    labelText: 'Enter Mobile Number',
                    border: InputBorder.none,
                  ),
                  initialCountryCode: 'JP',
                  onChanged: (phone) {
                    phoneNumber = phone.completeNumber;
                  },
                ),
              ),

              const SizedBox(height: 20),

              // Generate OTP Button
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
                  onPressed: sendOtp,
                  child: const Text(
                    "Generate OTP",
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
