import 'package:chateo/screens/screen4.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'dart:async';

class Screen3 extends StatefulWidget {
  final String phoneNumber;

  const Screen3({super.key, required this.phoneNumber});

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  TextEditingController otpController = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;
  bool hasError = false;
  String currentText = "";

  @override
  void initState() {
    super.initState();
    errorController = StreamController<ErrorAnimationType>();
  }

  @override
  void dispose() {
    errorController?.close();
    otpController.dispose();
    super.dispose();
  }

  void verifyCode(String code) {
    if(code =="1111"){
      Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>const Screen4()),
                      );
    }
    //logic for verifying code
  }

  void resendCode() {
    //logic for resending code
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Based On mode
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Color(0xFF0F1828),
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
                const SizedBox(height: 70),
                Center(
                  child: Column(
                    children: [
                      Text(
                        'Enter Code',
                        style: GoogleFonts.mulish(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'We have sent you an SMS with the code\n to ${widget.phoneNumber}',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.mulish(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 40),

                      PinCodeTextField(
                        appContext: context,
                        length: 4,
                        controller: otpController,
                        keyboardType: TextInputType.number,
                        animationType: AnimationType.fade,
                        errorAnimationController: errorController,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(8),
                          fieldHeight: 40,
                          fieldWidth: 40,
                          activeFillColor: Colors.white,
                          inactiveFillColor: Colors.white,
                          selectedFillColor: Colors.grey[200],
                          activeColor: Colors.blue,
                          selectedColor: Colors.blueAccent,
                          inactiveColor: Colors.grey,
                        ),
                        mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly, 
                        animationDuration: const Duration(milliseconds: 300),
                        enableActiveFill: true,
                        onCompleted: (v) => verifyCode(v),
                        onChanged: (value) => currentText = value,
                        beforeTextPaste: (text) => true,
                      ),

                      const SizedBox(height: 20),
                      hasError
                          ? Text(
                              "Invalid code",
                              style: TextStyle(
                                color: Colors.red[700],
                                fontSize: 14,
                              ),
                            )
                          : const SizedBox.shrink(),

                      const SizedBox(height: 40),

                      TextButton(
                        onPressed: resendCode,
                        child: Text(
                          'Resend Code',
                          style: GoogleFonts.mulish(
                            color: const Color(0xFF002DE3),
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
