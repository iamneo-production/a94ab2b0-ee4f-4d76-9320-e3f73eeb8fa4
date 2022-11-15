import 'package:dotpay/elements/label_dialog.dart';
import 'package:dotpay/helperMethods/label_helper.dart';
import 'package:dotpay/helperMethods/stripe_helper.dart';
import 'package:dotpay/models/categories.dart';
import 'package:dotpay/models/transaction.dart';
import 'package:dotpay/screens/card.dart';
import 'package:dotpay/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import '../../utils/gradient_slider.dart';

final controller = PageController(initialPage: 1);

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  // List<Category> categories = [
  //   Category(
  //       name: 'Household',
  //       createdTime: DateTime.fromMillisecondsSinceEpoch(1667280869380),
  //       limit: 20000.0),
  //   Category(
  //       name: 'Ps5',
  //       createdTime: DateTime.fromMillisecondsSinceEpoch(1667280869380),
  //       limit: 20000.0),
  //   Category(
  //       name: 'Savings',
  //       createdTime: DateTime.fromMillisecondsSinceEpoch(1667280869380),
  //       limit: 20000.0),
  //   Category(
  //       name: 'Car',
  //       createdTime: DateTime.fromMillisecondsSinceEpoch(1667280869380),
  //       limit: 20000.0),
  //   Category(
  //       name: 'Household',
  //       createdTime: DateTime.fromMillisecondsSinceEpoch(1667280869380),
  //       limit: 20000.0)
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 340,
                      decoration: BoxDecoration(color: Color(0xFF2F3A8E)),
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: SingleChildScrollView(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Color(0xFFD9D9D9),
                                      radius: 28,
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              PageTransition(
                                                  duration: Duration(
                                                      milliseconds: 400),
                                                  type: PageTransitionType
                                                      .leftToRight,
                                                  child: SideBarScreen()));
                                        },
                                        icon: Icon(
                                          Icons.menu,
                                          color: Colors.white,
                                        ))
                                  ],
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  'Welcome back, John Doe',
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.dmSans(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  height: 51,
                                ),
                                Container(
                                  constraints: BoxConstraints(maxWidth: 101),
                                  padding: const EdgeInsets.all(7),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color:
                                          Color(0xFFD9D9D9).withOpacity(0.13)),
                                  child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Savings',
                                          style: GoogleFonts.dmSans(
                                              color: Color(0xFFC4C4C4)),
                                        ),
                                        Icon(
                                          Icons.info_outline_rounded,
                                          color: Color(0xFFC4C4C4),
                                        )
                                      ]),
                                ),
                                SizedBox(
                                  height: 41,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Amount',
                                      style: GoogleFonts.dmSans(
                                          fontSize: 16, color: Colors.white),
                                    ),
                                    SizedBox(
                                      width: 7,
                                    ),
                                    Text(
                                      '₹20,000',
                                      style: GoogleFonts.dmSans(
                                          fontSize: 16, color: Colors.white),
                                    ),
                                  ],
                                ),
                                // Container(
                                //   alignment: Alignment.centerLeft,
                                //   width: 220,
                                //   child: SliderTheme(
                                //       data: SliderTheme.of(context).copyWith(
                                //           trackHeight: 10,
                                //           trackShape: GradientRectSliderTrackShape(
                                //               gradient: LinearGradient(colors: [
                                //                 Color(0xFF387AA9),
                                //                 Color(0xFF278F82)
                                //               ]),
                                //               darkenInactive: true),
                                //           thumbShape: SliderComponentShape.noThumb),
                                //       child: Slider(
                                //         value: 50,
                                //         max: 100,
                                //         inactiveColor: Color(0xFFF2F2F2),
                                //         min: 0,
                                //         onChanged: (value) {},
                                //       )),
                                // )
                                SizedBox(
                                  height: 7,
                                ),
                                Container(
                                  height: 12,
                                  width: 220,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16.0),
                                      color: Color(0xFFF2F2F2)),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          height: 12,
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(colors: [
                                                Color(0xFF387AA9),
                                                Color(0xFF278F82)
                                              ]),
                                              borderRadius:
                                                  BorderRadius.circular(16)),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 4,
                                        child: Container(
                                          height: 12,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(16)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  'Available Limit ₹1 Lacs',
                                  style: GoogleFonts.dmSans(
                                      color: Colors.white, fontSize: 12),
                                )
                              ]),
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 91,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 9),
                            height: 65,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  FutureBuilder<List<Category>>(
                                      future: LabelHelper.getLabels(12345),
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          var list = snapshot.data!
                                              .where((element) =>
                                                  element.isVisible == true)
                                              .toList();
                                          return ListView.builder(
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              scrollDirection: Axis.horizontal,
                                              itemCount: snapshot.data!.length,
                                              itemBuilder: (context, index) {
                                                return Container(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 15,
                                                      vertical: 5),
                                                  margin:
                                                      const EdgeInsets.all(7),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      border: Border.all(
                                                          color:
                                                              Color(0xFF3847A9),
                                                          width: 2)),
                                                  child: Center(
                                                      child: Text(
                                                    list[index].name,
                                                    style: GoogleFonts.dmSans(
                                                        color: Colors.black,
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  )),
                                                );
                                              });
                                        } else {
                                          return Container();
                                        }
                                      }),
                                  InkWell(
                                    onTap: () async {
                                      // final rev = await showDialog(
                                      //     context: context,
                                      //     builder: (context) => AddLabel(),
                                      //     barrierDismissible: false);
                                      // setState(() {});
                                      StripeHelper helper = StripeHelper();
                                      helper.makePayment(100, context);
                                      // helper.uploadPayment(12345, name, amt, transactionType, label)
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 5),
                                      margin: const EdgeInsets.all(7),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                              color: Color(0xFF3847A9),
                                              width: 2)),
                                      child: Center(
                                          child: Text(
                                        'Add a new Tag',
                                        style: GoogleFonts.dmSans(
                                            color: Colors.black,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500),
                                      )),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 26,
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 24,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Activity',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w500),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 6),
                              width: 215,
                              height: 6,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  gradient: LinearGradient(colors: [
                                    Color(0xFF387AA9),
                                    Color(0xFF278F82)
                                  ])),
                            ),
                          ],
                        )),
                    FutureBuilder(
                      future: StripeHelper.getTransactionList(5567890032),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: snapshot.data!.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              TransactionModel transaction =
                                  snapshot.data![index];
                              return Container(
                                  width: double.maxFinite,
                                  padding: EdgeInsets.all(15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            backgroundColor: Color(0xFFFF6060)
                                                .withOpacity(0.25),
                                            backgroundImage: NetworkImage(
                                                transaction.logo[
                                                    transaction.label_type]),
                                          ),
                                          SizedBox(
                                            width: 22,
                                          ),
                                          Text(
                                            transaction.name,
                                            style: GoogleFonts.dmSans(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black),
                                          )
                                        ],
                                      ),
                                      Text(
                                        '\u{20B9}${transaction.Amt.toString()}',
                                        style: GoogleFonts.dmSans(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            color: Color(
                                                transaction.transaction_type ==
                                                        'credit'
                                                    ? 0xFFA95338
                                                    : 0xFF278F82)),
                                      )
                                    ],
                                  ));
                            },
                          );
                        }
                        return Container();
                      },
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 240,
              right: -190,
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CardPage()));
                },
                child: Hero(
                  tag: 'card',
                  child: Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(-3, 2),
                              blurRadius: 6,
                              color: Colors.black.withOpacity(0.25))
                        ],
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            image: AssetImage('assets/card.png'))),
                    width: 327,
                    height: 185,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
