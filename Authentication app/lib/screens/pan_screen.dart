import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:okey/components/input_boxes.dart';
import 'package:okey/components/rounded_button.dart';
import 'package:okey/constants.dart';
import 'package:okey/screens/aadhar_screen.dart';
import 'package:okey/screens/login.dart';

class PanScreen extends StatelessWidget {
  const PanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(21.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            Image.asset(
              'assets/okey_logo.png',
              height: 80,
              width: 80,
            ),
            SizedBox(
              height: 60,
            ),
            Container(
              width: 347,
              height: 160,
              color: kGreyColor,
            ),
            SizedBox(
              height: 37,
            ),
            inputBoxes(
                hintText: "Enter PAN number",
                keyboardStyle: TextInputType.text),
            SizedBox(
              height: 10,
            ),
            RoundedButton(
              text: "Start One Time KYC",
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AadharScreen()));
              },
            ),
            SizedBox(
              height: 20,
            ),
            Divider(
              color: kPrimaryColor,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Already have an account",
              style: GoogleFonts.montserrat(
                  fontSize: 15, fontWeight: FontWeight.w500),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: Text(
                "Login",
                style: GoogleFonts.montserrat(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xffFF4F5A)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
