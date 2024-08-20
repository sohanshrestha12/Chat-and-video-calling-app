import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class OTPVerifyPage extends StatelessWidget {
  const OTPVerifyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 140,
        ),
        Center(
            child: Text(
          "Enter Verification Code",
          style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w500),
        )),
        const SizedBox(height: 30),
        Image.asset(
          'assets/security.png',
          height: 110,
        ),
        const SizedBox(height: 30),
        Center(
          child: Text(
            "Enter OTP",
            style:
                GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(height: 18),
        Opacity(
          opacity: 0.7,
          child: Center(
            child: Text(
              "Enter 4-Digit OTP sent to()",
              style: GoogleFonts.poppins(color: Colors.grey[500], fontSize: 12),
            ),
          ),
        ),
        const SizedBox(height: 18),
        Form(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 60,
              width: 60,
              child: TextField(
                //to make textfield accept only number
                keyboardType: TextInputType.number,
                //to make textfield limit only one value
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  //to make only accept the integers only
                  FilteringTextInputFormatter.digitsOnly
                ],
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide(width: 1)),
                ),
              ),
            ),
            SizedBox(
              height: 60,
              width: 60,
              child: TextField(
                //to make textfield accept only number
                keyboardType: TextInputType.number,
                //to make textfield limit only one value
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  //to make only accept the integers only
                  FilteringTextInputFormatter.digitsOnly
                ],
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide(width: 1)),
                ),
              ),
            ),
            SizedBox(
              height: 60,
              width: 60,
              child: TextField(
                //to make textfield accept only number
                keyboardType: TextInputType.number,
                //to make textfield limit only one value
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  //to make only accept the integers only
                  FilteringTextInputFormatter.digitsOnly
                ],
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide(width: 1)),
                ),
              ),
            ),
            SizedBox(
              height: 60,
              width: 60,
              child: TextField(
                //to make textfield accept only number
                keyboardType: TextInputType.number,
                //to make textfield limit only one value
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  //to make only accept the integers only
                  FilteringTextInputFormatter.digitsOnly
                ],
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide(width: 1)),
                ),
              ),
            ),
          ],
        )),
        const SizedBox(height: 18),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 140, vertical: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.blue,
          ),
          child: Text(
            "Verify",
            style: GoogleFonts.poppins(
                fontSize: 15, color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(height: 20),
        Center(
          child: Text(
            "Re-send OTP",
            style: GoogleFonts.poppins(
                fontSize: 13, fontWeight: FontWeight.w500, color: Colors.blue),
          ),
        )
      ],
    );
  }
}
