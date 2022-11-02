import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:okey/components/rounded_button.dart';
import 'package:okey/screens/login.dart';
import 'package:okey/screens/sign_up.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

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
              height: 70,
            ),
            Image.asset(
              'assets/okey_logo.png',
              height: 80,
              width: 80,
            ),
            SizedBox(
              height: 60,
            ),
            Image.asset('assets/signup.png'),
            SizedBox(
              height: 17,
            ),
            Text(
              "One time KYC for all Your banking",
              style: GoogleFonts.montserrat(
                  fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 50,
            ),
            RoundedButton(
              text: "Start One Time KYC",
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignUpSreen()));
              },
            ),
            SizedBox(
              height: 26,
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
