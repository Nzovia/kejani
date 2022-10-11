import 'package:flutter/material.dart';
import 'package:kejani/pages/notifications_page.dart';
import 'package:kejani/pages/tabs/paid_bills.dart';
import 'package:kejani/pages/tabs/pending_bills.dart';

class UserBills extends StatefulWidget {
  const UserBills({Key? key}) : super(key: key);

  @override
  State<UserBills> createState() => _UserBillsState();
}

class _UserBillsState extends State<UserBills> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            leading: Builder(
              builder: (context) => IconButton(
                icon: const Icon(
                  Icons.menu,
                  size: 24,
                  color: Colors.white,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            ),
            centerTitle: true,
            title: const Text(
              "My Bills",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NotificationsPage()));
                  },
                  icon: const Icon(
                    Icons.notification_important_rounded,
                    size: 24.0,
                    color: Colors.white,
                  ))
            ],
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: "Paid",
                ),
                Tab(
                  text: "Pending",
                )
              ],
            ),
          ),
          body: const TabBarView(
            children: [PaidBills(), PendingBills()],
          ),
        ));
  }
}
