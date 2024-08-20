import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:seventh_sem_project/components/my_textfield.dart';

class OtpPhoneNoFillPage extends StatelessWidget {
  OtpPhoneNoFillPage({super.key});

  final TextEditingController _otpPhoneNoController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          const SizedBox(height: 100),
          Center(
            child: Text(
              "OTP Verification",
              style:
                  GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 30),
          Image.asset(
            'assets/smartphone.png',
            height: 110,
          ),
          const SizedBox(height: 30),
          Center(
            child: Text(
              "Enter your mobile number",
              style:
                  GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 18),
          Opacity(
            opacity: 0.7,
            child: Center(
              child: Text(
                "we will send you an OTP message",
                style: GoogleFonts.poppins(color: Colors.grey[500], fontSize: 12),
              ),
            ),
          ),
          const SizedBox(height: 18),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 19),
            child: IntlPhoneField(
              decoration: InputDecoration(
                labelText: "Phone Number",
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                )
              ),
            ),
          ),
          const SizedBox(height: 18),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 140, vertical: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.blue,
            ),
            child: Text(
              "Get OTP",
              style: GoogleFonts.poppins(
                  fontSize: 15, color: Colors.white, fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }
}
