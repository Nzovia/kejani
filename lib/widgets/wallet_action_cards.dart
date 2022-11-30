import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WalletActionButton extends StatelessWidget {
  //button properties
  final IconData? buttonIcon;
  final Color buttonColor;
  final String buttonName;

  const WalletActionButton(
      {Key? key, required this.buttonIcon, required this.buttonColor, required this.buttonName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipOval(
          child: Material(
            color: buttonColor,
            child: InkWell(
              splashColor: Colors.green,
              onTap: () {},
              child: SizedBox(
                width: 50,
                height: 50,
                child: Icon(buttonIcon),
              ),
            ),
          ),
        ),
        Text(buttonName,style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w300, fontSize: 12), )
      ],
    );
  }
}
