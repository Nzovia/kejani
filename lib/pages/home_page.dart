import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:kejani/components/navigation_drawer.dart';
import 'package:kejani/pages/add_a_billItem.dart';
import 'package:kejani/pages/bills_summary.dart';
import 'package:kejani/pages/UserProfile.dart';
import 'package:kejani/pages/loading_cards_page.dart';
import 'package:kejani/pages/tabs/pending_bills.dart';
import 'package:kejani/pages/user_bills_page.dart';
import 'tabs/paid_bills.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = [
    UserBills(),
    LoadCreditCard(),
    UserBillsSummary(),
    UserProfile(),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawerEnableOpenDragGesture: false,
        body: _widgetOptions[_selectedIndex],
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddBillItem()));
          },
          child: const Icon(Icons.add),
          backgroundColor: Colors.green,
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              border:
                  Border(top: BorderSide(color: Colors.black26, width: 1.0))),
          child: GNav(
            activeColor: Colors.green,
            haptic: true,
            tabs: const [
              GButton(
                icon: Icons.home,
                text: "Home",
              ),
              GButton(
                icon: Icons.wallet,
                text: "Wallet",
              ),
              GButton(
                icon: Icons.summarize_outlined,
                text: "account",
              ),
              GButton(
                icon: Icons.account_circle_rounded,
                text: "me",
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
