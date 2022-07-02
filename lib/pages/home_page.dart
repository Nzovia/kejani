import 'package:flutter/material.dart';
import 'package:kejani/components/navigation_drawer.dart';
import 'package:kejani/pages/tabs/pending_bills.dart';
import 'tabs/paid_bills.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawerEnableOpenDragGesture: false,
        drawer: NavigationDrawer(),
        appBar: AppBar(
          leading: Builder(builder: (context) =>
              IconButton(
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
            IconButton(onPressed: (){},
                icon: const Icon(
                  Icons.add,
                  size:24.0,
                  color: Colors.white,
                ))
          ],
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "Pending",
              ),
              Tab(
                text: "Paid",
              )
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            PaidBills(),
            PendingBills()
          ],

        ),
      ),
    );
  }
}
