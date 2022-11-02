import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:okey/components/input_boxes.dart';
import 'package:okey/components/rounded_button.dart';

import 'package:okey/constants.dart';
import 'package:okey/screens/login.dart';
import 'package:okey/screens/pan_screen.dart';

class SignUpSreen extends StatelessWidget {
  const SignUpSreen({super.key});

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
              height: 110,
            ),
            inputBoxes(
              hintText: 'Enter your name',
              keyboardStyle: TextInputType.text,
            ),
            inputBoxes(
              hintText: 'Enter your Email ID',
              keyboardStyle: TextInputType.emailAddress,
            ),
            inputBoxes(
              hintText: 'Enter your Phone Number',
              keyboardStyle: TextInputType.phone,
            ),
            SizedBox(
              height: 20,
            ),
            RoundedButton(
              text: "Next",
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PanScreen()));
              },
            ),
            SizedBox(
              height: 30,
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
