import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotpay/custom_colors.dart';
import 'package:dotpay/helperMethods/stripe_helper.dart';
import 'package:dotpay/screens/auth/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';
import 'package:web3dart/web3dart.dart';

import '../../helperMethods/wallet_connect.dart';

class Welcomescreen extends StatefulWidget {
  const Welcomescreen({super.key});

  @override
  State<Welcomescreen> createState() => _WelcomescreenState();
}

class _WelcomescreenState extends State<Welcomescreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final controller = CarouselController();
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/back.png'), fit: BoxFit.cover)),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset('assets/logo.png'),
                  CarouselSlider(
                      carouselController: controller,
                      items: [
                        'assets/women_tea.png',
                        'assets/women_tea.png',
                        'assets/women_tea.png'
                      ].map((e) {
                        return FittedBox(
                          child: Container(
                            width: width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  e,
                                  height: 275,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  'Save smart grow smart',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.dmSans(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                      options: CarouselOptions(
                        height: 275,
                        initialPage: 0,
                        enableInfiniteScroll: false,
                        reverse: false,
                        autoPlay: false,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                      )),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                      alignment: Alignment.center,
                      child: AnimatedSmoothIndicator(
                          activeIndex: _currentIndex, count: 3)),
                  SizedBox(
                    height: 25,
                  ),
                  InkWell(
                    onTap: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterScreen()));
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 0.11 * width),
                      height: 69,
                      padding: const EdgeInsets.symmetric(vertical: 13),
                      child: Center(
                          child: Text(
                        'Register',
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
                    height: 45,
                  ),
                  Text(
                    'Already have an account?',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.dmSans(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  Text(
                    'Login',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.dmSans(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: DotPayColors.redAccent),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
