import 'package:chateo/screens/screen2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 70),

              
              Image.asset(
                'lib/assets/screen1.png',
                width: 260,
                height: 250,
              ),

              
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Text(
                  'Connect easily with \nyour family and friends\n over countries',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.mulish(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: const Color(0xFF0F1828),
                  ),
                ),
              ),

              //Note : clickable text
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 20),
                child: Text(
                  'Terms & Privacy Policy',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.mulish(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF0F1828),
                  ),
                ),
              ),
              
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
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>const Screen2()),
                      );
                  },
                  child: Text(
                    'Start Messaging',
                    style: GoogleFonts.mulish(
                      color: Colors.white70,
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
