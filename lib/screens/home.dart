import 'package:dotpay/screens/cheque.dart';
import 'package:dotpay/screens/investment.dart';
import 'package:dotpay/screens/tabs/dashboard.dart';
import 'package:dotpay/screens/transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> widgets = [
    Dashboard(),
    Transaction(),
    ChequePage(),
    InvestmentPage()
  ];
  int _selectedTab = 0;
  void onTap(int i) {
    setState(() {
      _selectedTab = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: IndexedStack(
        index: _selectedTab,
        children: widgets,
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: Color(0xFF303A91)),
        child: BottomNavigationBar(
            currentIndex: _selectedTab,
            onTap: onTap,
            showSelectedLabels: true,
            selectedItemColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.dashboard), label: 'Dashboard'),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/transaction.png')),
                  label: 'Transaction'),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(
                    'assets/cheque.png',
                  )),
                  label: 'Cheques'),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(
                    'assets/investment.png',
                  )),
                  label: 'Investment')
            ]),
      ),
    );
  }
}
