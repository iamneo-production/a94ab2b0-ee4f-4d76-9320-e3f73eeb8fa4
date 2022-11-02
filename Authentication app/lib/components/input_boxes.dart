import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:okey/constants.dart';

class inputBoxes extends StatelessWidget {
  String hintText;
  TextInputType keyboardStyle;
  inputBoxes({
    Key? key,
    required this.hintText,
    required this.keyboardStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: kPrimaryColor,
        ),
      ),
      child: TextFormField(
        keyboardType: keyboardStyle,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.montserrat(),
          border: InputBorder.none,
          labelStyle: GoogleFonts.roboto(),
        ),
      ),
    );
  }
}
