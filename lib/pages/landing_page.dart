import 'package:flutter/material.dart';
import 'package:kejani/pages/home_page.dart';
import 'package:kejani/pages/user_registration.dart';
import '../constants/app_colors.dart';


class LandingPage extends StatefulWidget {
  final Color background ;
  const LandingPage({Key? key,
    this.background =  appBackground
  }) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  void initState(){
    _getHome();
  }

  //navigating to the next activity
  _getHome() async{
    await Future.delayed(const Duration(milliseconds: 2000), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => UserRegistration()));
    });

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.background,
      child: Center(
        child: Container(
          height: 750,
            width: 750,
            child: Image.asset("assets/images/applogo.png")
        ),
      ),

    );
  }
}

