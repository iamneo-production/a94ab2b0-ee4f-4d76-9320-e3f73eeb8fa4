import 'package:dotpay/elements/slider_card_ipopular_funds.dart';
import 'package:dotpay/elements/slider_card_quick_acess.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class InvestmentPage extends StatefulWidget {
  const InvestmentPage({super.key});

  @override
  State<InvestmentPage> createState() => _InvestmentPageState();
}

class _InvestmentPageState extends State<InvestmentPage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF303189),
        title: Text(
          'Investments ',
          style: GoogleFonts.dmSans(
            textStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
          ),
        ),
      ),
      endDrawer: Drawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8),
              Text(
                'Popular funds',
                style: GoogleFonts.dmSans(
                  textStyle:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  height: 163.0,
                  child: new ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      SliderCards(
                          comapanyName: 'ICICI Prodential technology',
                          titleName: 'Direct Plan growth',
                          description:
                              'Lorem ipsum dolor sit amet, consectetur adi piscing elit,',
                          percentage: '30%',
                          years: 3),
                      SizedBox(
                        width: 16,
                      ),
                      SliderCards(
                          comapanyName: 'ICICI Prodential technology',
                          titleName: 'Direct Plan growth',
                          description:
                              'Lorem ipsum dolor sit amet, consectetur adi piscing elit,',
                          percentage: '30%',
                          years: 3),
                      SizedBox(
                        width: 16,
                      ),
                      SliderCards(
                          comapanyName: 'ICICI Prodential technology',
                          titleName: 'Direct Plan growth',
                          description:
                              'Lorem ipsum dolor sit amet, consectetur adi piscing elit,',
                          percentage: '30%',
                          years: 3),
                    ],
                  )),
              SizedBox(
                height: 23,
              ),
              Text(
                'Quick Access',
                style: GoogleFonts.dmSans(
                  textStyle:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
                ),
              ),
              SizedBox(
                height: 23,
              ),
              Container(
                  height: 104.0,
                  child: new ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      SliderCardQuickAcess(),
                      SizedBox(width: 15),
                      SliderCardQuickAcess(),
                      SizedBox(width: 15),
                      SliderCardQuickAcess(),
                      SizedBox(width: 15),
                      SliderCardQuickAcess(),
                      SizedBox(width: 15),
                    ],
                  )),
              SizedBox(
                height: 23,
              ),
              Text(
                'All Funds',
                style: GoogleFonts.dmSans(
                  textStyle:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
                ),
              ),
              SizedBox(
                height: 23,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/boi.png'),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bank of India Small cap',
                          style: GoogleFonts.dmSans(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                color: Color(0xff000000)),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Direct Growth',
                          style: GoogleFonts.dmSans(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                color: Color(0xff000000)),
                          ),
                        ),
                        Text(
                          'Equity Small Cap . 5 🌟',
                          style: GoogleFonts.dmSans(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                color: Color(0xff525252)),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '52%',
                      style: GoogleFonts.dmSans(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 16),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 34 / 2),
              Divider(),
              SizedBox(height: 34 / 2),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/boi.png'),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bank of India Small cap',
                          style: GoogleFonts.dmSans(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                color: Color(0xff000000)),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Direct Growth',
                          style: GoogleFonts.dmSans(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                color: Color(0xff000000)),
                          ),
                        ),
                        Text(
                          'Equity Small Cap . 5 🌟',
                          style: GoogleFonts.dmSans(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                color: Color(0xff525252)),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '52%',
                      style: GoogleFonts.dmSans(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 16),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 34 / 2),
              Divider(),
              SizedBox(height: 34 / 2),
            ],
          ),
        ),
      ),
    );
  }
}
