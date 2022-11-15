import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import '../../custom_colors.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/back.png',
                ),
                fit: BoxFit.cover)),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset('assets/logo.png'),
                Text(
                  'Open your account in few steps',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.dmSans(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Container(
                            alignment: Alignment.center,
                            child: Image.asset('assets/phone.png')),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Enter your phone details connected to bank account',
                          style: GoogleFonts.dmSans(
                              fontSize: 16, color: Colors.white),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          'Phone Number',
                          style: GoogleFonts.dmSans(
                              fontSize: 18, color: Colors.white),
                        ),
                        TextField(
                          style: GoogleFonts.dmSans(color: Colors.grey),
                          controller: controller,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                      ]),
                ),
                SizedBox(
                  height: 40,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            duration: Duration(milliseconds: 500),
                            type: PageTransitionType.rightToLeft,
                            child: Second()));
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 26,
                    ),
                    height: 69,
                    padding: const EdgeInsets.symmetric(vertical: 13),
                    child: Center(
                        child: Text(
                      'Next',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.dmSans(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    )),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: DotPayColors.redAccent),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  'Back',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.dmSans(
                      color: DotPayColors.redAccent, fontSize: 20),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Second extends StatefulWidget {
  const Second({super.key});

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/back.png',
                  ),
                  fit: BoxFit.cover)),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset('assets/logo.png'),
                  Text(
                    'Open your account in few steps',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.dmSans(
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Container(
                              alignment: Alignment.center,
                              child: Image.asset('assets/mail.png')),
                          SizedBox(
                            height: 14,
                          ),
                          Text(
                            'Enter your email and personal details connected to bank accont',
                            style: GoogleFonts.dmSans(
                                fontSize: 16, color: Colors.white),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Text(
                            'Name',
                            style: GoogleFonts.dmSans(
                                fontSize: 18, color: Colors.white),
                          ),
                          TextField(
                            controller: nameController,
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Email id',
                            style: GoogleFonts.dmSans(
                                fontSize: 18, color: Colors.white),
                          ),
                          TextField(
                            controller: emailController,
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Email id',
                            style: GoogleFonts.dmSans(
                                fontSize: 18, color: Colors.white),
                          ),
                          TextField(
                            controller: emailController,
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              duration: Duration(milliseconds: 400),
                              type: PageTransitionType.leftToRight,
                              child: Third()));
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 26,
                      ),
                      height: 69,
                      padding: const EdgeInsets.symmetric(vertical: 13),
                      child: Center(
                          child: Text(
                        'Next',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.dmSans(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      )),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: DotPayColors.redAccent),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    'Back',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.dmSans(
                        color: DotPayColors.redAccent, fontSize: 20),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Third extends StatefulWidget {
  const Third({super.key});

  @override
  State<Third> createState() => _ThirdState();
}

class _ThirdState extends State<Third> {
  final kycController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/back.png',
                ),
                fit: BoxFit.cover)),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset('assets/logo.png'),
                Text(
                  'Open your account in few steps',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.dmSans(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Container(
                            alignment: Alignment.center,
                            child: Image.asset('assets/mail.png')),
                        SizedBox(
                          height: 14,
                        ),
                        Text(
                          'Enter your one time verification id. Check your one time KYC app',
                          style: GoogleFonts.dmSans(
                              fontSize: 16, color: Colors.white),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          'Unique ID for KYC',
                          style: GoogleFonts.dmSans(
                              fontSize: 18, color: Colors.white),
                        ),
                        TextField(
                          controller: kycController,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ]),
                ),
                SizedBox(
                  height: 40,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 26,
                    ),
                    height: 69,
                    padding: const EdgeInsets.symmetric(vertical: 13),
                    child: Center(
                        child: Text(
                      'Submit',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.dmSans(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    )),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: DotPayColors.redAccent),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
