import 'package:flutter/material.dart';
import 'package:kejani/pages/home_page.dart';
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
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
    });

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.background,
      child: Center(
        child: Container(
            child: Image.asset("assets/images/applogo.png")
        ),
      ),

    );
  }
}

