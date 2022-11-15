import 'dart:io';

import 'package:dotpay/elements/separator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class ChequePage extends StatefulWidget {
  const ChequePage({super.key});

  @override
  State<ChequePage> createState() => _ChequePageState();
}

class _ChequePageState extends State<ChequePage> {
  DateTime selectedDate = DateTime.now();
  var startController = TextEditingController();
  var enddate = TextEditingController();
  Future<Null> selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1901, 1),
        lastDate: DateTime(2100));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        String convertedDateTime =
            "${picked.year.toString()}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
        // widget.textController.value = TextEditingValue(text: picked.toString());
        controller.value = TextEditingValue(text: convertedDateTime);
        ;
      });
  }

  File? image;
  Future clickImage() async {
    var imgPicker = ImagePicker();
    var imageFile = await imgPicker.pickImage(
        source: ImageSource.gallery, imageQuality: 90);

    if (imageFile != null) {
      if (kDebugMode) {
        print("You selected  image : " + imageFile.path);
      }
      setState(() {
        image = File(imageFile.path);
      });

      return File(imageFile.path);
    } else {
      if (kDebugMode) {
        print("You have not taken image");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF303189),
        title: Text(
          'Cheque ',
          style: GoogleFonts.dmSans(
            textStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
          ),
        ),
      ),
      endDrawer: Drawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 31),
            Text(
              "Upload Cheque",
              style: GoogleFonts.dmSans(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                  color: Color(0xff141414),
                ),
              ),
            ),
            SizedBox(height: 1),
            Text(
              """Have a Cheque and can’t visit the bank inperson ?\nDotPay is here to help you !!!\nUpload a pciture of your Cheque and get your money""",
              style: GoogleFonts.dmSans(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Color(0xff3F3F3F),
              ),
            ),
            SizedBox(height: 18),
            Container(
              width: 380,
              height: 186,
              child: Center(
                child: image == null
                    ? InkWell(
                        onTap: () {
                          clickImage();
                        },
                        child: Image.asset('assets/camera.png'))
                    : Image.file(image!),
              ),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 111, 106, 106),
              ),
            ),
            SizedBox(height: 50),
            Text(
              "Create Virtual Cheque",
              style: GoogleFonts.dmSans(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                  color: Color(0xff141414),
                ),
              ),
            ),
            SizedBox(height: 1),
            Text(
              "Need a Virtual Cheque ,DotPay got your back",
              style: GoogleFonts.dmSans(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Color(0xff3F3F3F),
                ),
              ),
            ),
            Container(
              color: Color(0xFFD9D9D9),
              height: 219,
              child: Stack(
                children: [
                  Positioned(
                    top: 5,
                    left: 5,
                    right: 5,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/calendar.png',
                              height: 100,
                              width: 100,
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text('Valid From'),
                                    IconButton(
                                        onPressed: () {
                                          selectDate(context, startController);
                                        },
                                        icon: Icon(Icons.calendar_today)),
                                    Container(
                                      width: 100,
                                      child: TextFormField(
                                        readOnly: true, //this is important
                                        //the method for opening data picker
                                        controller:
                                            startController, //the controller
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text('Valid To'),
                                    IconButton(
                                        onPressed: () {
                                          selectDate(context, enddate);
                                        },
                                        icon: Icon(Icons.calendar_today)),
                                    Container(
                                      width: 100,
                                      child: TextFormField(
                                        readOnly: true, //this is important
                                        //the method for opening data picker
                                        controller: enddate, //the controller
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text('Amount'),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    Container(
                                      width: 115,
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        //controller: enddate, //the controller
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        MySeparator(),
                        SizedBox(
                          width: 250,
                          child: MaterialButton(
                            color: Color(0xFF303A91),
                            onPressed: () {},
                            child: Center(
                                child: Text(
                              'ADD Recipient',
                              style: GoogleFonts.dmSans(color: Colors.white),
                            )),
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: 130,
                    left: -25,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 25,
                    ),
                  ),
                  Positioned(
                    top: 130,
                    right: -25,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 25,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
