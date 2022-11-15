import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SliderCardQuickAcess extends StatefulWidget {
  const SliderCardQuickAcess({super.key});

  @override
  State<SliderCardQuickAcess> createState() => _SliderCardQuickAcessState();
}

class _SliderCardQuickAcessState extends State<SliderCardQuickAcess> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 103,
      decoration: BoxDecoration(
        color: Color(0xffD9D9D9),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    );
  }
}
