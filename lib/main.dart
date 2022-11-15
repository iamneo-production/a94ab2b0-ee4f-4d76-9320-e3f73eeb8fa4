import 'package:dotpay/screens/auth/register.dart';
import 'package:dotpay/screens/auth/welcome.dart';
import 'package:dotpay/screens/card.dart';
import 'package:dotpay/screens/cheque.dart';
import 'package:dotpay/screens/earned_coin.dart';
import 'package:dotpay/screens/home.dart';
import 'package:dotpay/screens/investment.dart';
import 'package:dotpay/screens/tabs/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await dotenv.load(fileName: ".env");
  Stripe.publishableKey =
      'pk_test_51KKZqCSDWrglFC7UrrtKXzmdOxlbLBwMXBODmhA2GFW3iKiAIlqMPBexHEdF6UaiZAWGNHA9EUCasxi80nmKn8ep008knupJJ6';
  Stripe.merchantIdentifier = 'any string works';

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'dotpay',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Welcomescreen(),
      // home: RegisterScreen(),
      // home: CardPage(),
    );
  }
}
