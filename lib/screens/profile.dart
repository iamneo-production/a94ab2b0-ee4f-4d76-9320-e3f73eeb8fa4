import 'package:dotpay/screens/home.dart';
import 'package:dotpay/screens/tabs/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

class SideBarScreen extends StatefulWidget {
  const SideBarScreen({super.key});

  @override
  State<SideBarScreen> createState() => _SideBarScreenState();
}

class _SideBarScreenState extends State<SideBarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.maxFinite,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    duration: Duration(milliseconds: 400),
                                    type: PageTransitionType.rightToLeftPop,
                                    child: HomePage(),
                                    childCurrent: SideBarScreen()));
                          },
                          icon: Icon(
                            Icons.close,
                            size: 25,
                          ))),
                  SizedBox(height: 85),
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/icic.png"),
                    radius: 60,
                  ),
                  SizedBox(height: 21),
                  Text(
                    "John Doe",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.dmSans(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 28,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 7),
                  Text(
                    "8888888888",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.dmSans(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 7),
                  Text(
                    "johndoe@gmail.com",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.dmSans(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 31),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Age ",
                        style: GoogleFonts.dmSans(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: Color(0xff444444),
                          ),
                        ),
                      ),
                      Text(
                        "50",
                        style: GoogleFonts.dmSans(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: Color(0xff444444),
                          ),
                        ),
                      ),
                      Text(
                        " . Joined ",
                        style: GoogleFonts.dmSans(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: Color(0xff444444),
                          ),
                        ),
                      ),
                      Text(
                        "October 1947",
                        style: GoogleFonts.dmSans(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: Color(0xff444444),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 57),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Image.asset('assets/coin.gif',
                            height: 45, width: 45, fit: BoxFit.cover),
                        SizedBox(width: 30),
                        Text(
                          'Dotcoin',
                          style: GoogleFonts.dmSans(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 27),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Image.asset("assets/bottle_icon.png"),
                        SizedBox(width: 30),
                        Text(
                          'Rewards',
                          style: GoogleFonts.dmSans(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 27),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Image.asset("assets/question_mark.png"),
                        SizedBox(width: 30),
                        Text(
                          'Help and support',
                          style: GoogleFonts.dmSans(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 80),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Logout",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.dmSans(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          color: Color(0xffFF4F5A),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
