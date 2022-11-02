import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:okey/constants.dart';

class AccessRequestScreen extends StatelessWidget {
  const AccessRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
        title: Text(
          "Access Request",
          style:
              GoogleFonts.montserrat(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  height: 347,
                  width: 131,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          height: 20,
                          color: kPrimaryColor,
                        ),
                      ),
                      Container(
                        width: 347,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Jane Doe Banking solutions",
                                style: GoogleFonts.dmSans(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff2F2F2F)),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "KYC Access Request",
                                style: GoogleFonts.dmSans(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff303A91)),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 3),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Sent at- 31 January 2022",
                                          style: GoogleFonts.dmSans(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xff000000)),
                                        ),
                                        Text(
                                          "Closes at - 1st february 2022",
                                          style: GoogleFonts.dmSans(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xff000000)),
                                        ),
                                      ],
                                    ),
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: Text(
                                        "Allow",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white,
                                          elevation: 0,
                                          side: BorderSide(
                                              color: Color(0xff16CEB8),
                                              width: 1),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8))),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
