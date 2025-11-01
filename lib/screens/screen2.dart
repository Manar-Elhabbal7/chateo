import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  final TextEditingController _phoneController = TextEditingController();
  String phoneNumber = '';

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF0F1828)),
                onPressed: () => Navigator.pop(context),
              ),
              const SizedBox(height: 40),
              Center(
                child: Column(
                  children: [
                    Text(
                      'Enter Your Phone Number',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.mulish(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        color: const Color(0xFF0F1828),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Please confirm your country code and enter your phone number',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.mulish(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: const Color(0xFF0F1828),
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              IntlPhoneField(
                controller: _phoneController,
                keyboardType: TextInputType.phone, // ensures numeric keyboard
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                ),
                initialCountryCode: 'EG',
                onChanged: (phone) {
                  setState(() {
                    phoneNumber = phone.completeNumber;
                  });
                },
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF002DE3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    // Your continue logic here
                  },
                  child: Text(
                    'Continue',
                    style: GoogleFonts.mulish(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
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
