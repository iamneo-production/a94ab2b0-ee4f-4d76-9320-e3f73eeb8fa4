import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("KYC Card",
                style: GoogleFonts.dmSans(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.black)),
          ),
          Center(
            child: Container(
              width: 309,
              height: 477,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(2),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: CircleAvatar(
                        radius: 55,
                        backgroundColor: Color(0xff278F82),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage("assets/signup.png"),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    Center(
                      child: Text("John Doe",
                          style: GoogleFonts.dmSans(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    Text("Email Id: Johndoe@fakemail.com",
                        style: GoogleFonts.dmSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black)),
                    SizedBox(
                      height: 13,
                    ),
                    Text("Phone No: 88888888888",
                        style: GoogleFonts.dmSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black)),
                    SizedBox(
                      height: 13,
                    ),
                    Text("Aadhar Number:**** **** **** ****",
                        style: GoogleFonts.dmSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black)),
                    SizedBox(
                      height: 13,
                    ),
                    Text("Pan Card: ******",
                        style: GoogleFonts.dmSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black)),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Text("Your all documents are submitted and verified",
                style: GoogleFonts.dmSans(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black)),
          ),
        ],
      ),
    );
  }
}
