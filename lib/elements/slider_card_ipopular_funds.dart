import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meta/meta.dart';

class SliderCards extends StatefulWidget {
  // final String companyLogo;
  final String comapanyName;
  final String description;
  final String percentage;
  final String titleName;
  final int years;

  const SliderCards({
    Key? key,
    // required this.companyLogo,
    required this.comapanyName,
    required this.titleName,
    required this.description,
    required this.percentage,
    required this.years,
  }) : super(key: key);

  @override
  State<SliderCards> createState() => _SliderCardsState();
}

class _SliderCardsState extends State<SliderCards> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 163,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Color(0xff303088),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 9),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25),
            Image.asset("assets/icic.png"),
            SizedBox(height: 13),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "ICICI Prodential technology",
                  style: GoogleFonts.dmSans(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Color(0xffDCDCDC)),
                ),
                Text(
                  "30%",
                  style: GoogleFonts.dmSans(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Color(0xffFFFFFF)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Direct Plan growth",
                  style: GoogleFonts.dmSans(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      color: Color(0xffBDBDBD)),
                ),
                Text(
                  "3Y Returns",
                  style: GoogleFonts.dmSans(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      color: Color(0xffBDBDBD)),
                ),
              ],
            ),
            SizedBox(height: 7),
            Text(
              "Lorem ipsum dolor sit amet, consectetur adi piscing elit,",
              style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Color(0xffD6D6D6)),
            ),
          ],
        ),
      ),
    );
  }
}
