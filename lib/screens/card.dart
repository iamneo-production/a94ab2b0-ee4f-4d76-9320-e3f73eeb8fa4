import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF303189),
        title: Text(
          'Card',
          style: TextStyle(color: Colors.white),
        ),
      ),
      endDrawer: Drawer(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Hero(tag: 'card', child: Image.asset('assets/card.png')),
            SizedBox(
              height: 25,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF000000).withOpacity(0.25),
                      offset: Offset(3, 5),
                      blurRadius: 18,
                      spreadRadius: -5,
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Card Number",
                      style: TextStyle(color: Color(0xff585858)),
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('9846 8764 8778 8975'),
                        Text(
                          'COPY',
                          style: TextStyle(color: Color(0xffEE8627)),
                        ),
                      ],
                    ),
                    SizedBox(height: 25),
                    Text(
                      "Valid till",
                      style: TextStyle(color: Color(0xff585858)),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "01/27",
                    ),
                    SizedBox(height: 25),
                    Text(
                      "CVV",
                      style: TextStyle(color: Color(0xff585858)),
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('288'),
                        Text(
                          'COPY',
                          style: TextStyle(color: Color(0xffEE8627)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
