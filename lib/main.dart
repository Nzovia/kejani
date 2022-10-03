import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:kejani/pages/landing_page.dart';
import 'package:kejani/services/bills_service.dart';

void setUpLocator() {
  GetIt.instance.registerSingleton(() => BillService());
}

void main() {
  setUpLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kejani',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const LandingPage(),
    );
  }
}
