import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class EarnedCoinScreen extends StatefulWidget {
  const EarnedCoinScreen({super.key});

  @override
  State<EarnedCoinScreen> createState() => _EarnedCoinScreenState();
}

class _EarnedCoinScreenState extends State<EarnedCoinScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF303189),
        title: Text(
          'Earned Coin ',
          style: GoogleFonts.dmSans(
            textStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
          ),
        ),
      ),
      endDrawer: Drawer(),
      body: Column(
        children: [
          SizedBox(height: 90),
          Container(
              child: Lottie.asset(
                  fit: BoxFit.cover,
                  repeat: true,
                  width: 120,
                  height: 120,
                  'assets/coin.json')),
          SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "\$DOT 2.5",
                style: GoogleFonts.dmSans(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                    color: Color(0xff313131),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Text(
                "Refresh",
                style: GoogleFonts.dmSans(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: Color(0xffFF4F5A),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 9),
            decoration: BoxDecoration(
                color: Color(0xFFF2F1F1),
                borderRadius: BorderRadius.circular(200)),
            child: Text(
              "0x8E7A...dd17",
              style: GoogleFonts.dmSans(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                  color: Color(0xff797A7F),
                ),
              ),
            ),
          ),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Image.asset("assets/arrow_swap.png"),
                  SizedBox(height: 5),
                  Text(
                    "SWAP",
                    style: GoogleFonts.dmSans(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 22,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 30),
              Column(
                children: [
                  Image.asset("assets/arrow_side_down.png"),
                  SizedBox(height: 5),
                  Text(
                    "Redeem",
                    style: GoogleFonts.dmSans(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 22,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 15),
          Divider(
            color: Color(0xffDDDDDD),
          ),
          SizedBox(height: 15),
          Text(
            "Redeemable Amount",
            style: GoogleFonts.dmSans(
              textStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            "\$DOT 3.2",
            style: GoogleFonts.dmSans(
              textStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 22,
                color: Color(0xff313131),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
