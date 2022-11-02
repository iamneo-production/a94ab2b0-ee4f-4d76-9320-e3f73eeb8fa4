import 'package:flutter/material.dart';
import 'package:okey/constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  // final Function press;
  final void Function()? press;
  final Color color, textcolor;
  const RoundedButton({
    Key? key,
    required this.text,
    required this.press,
    this.textcolor = Colors.white,
    this.color = kPrimaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
        child: Text(
          text,
          style: TextStyle(color: textcolor),
        ),
        //onPressed: press,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16))),
          fixedSize: Size(size.height * 0.45, size.width * 0.13),
        ),
        onPressed: press,
      ),
    );
  }
}
