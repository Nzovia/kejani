import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String buttonText;
  final ShapeBorder shapeBorder;
  final VoidCallback onPressed;
  final Color buttonColor;

  const ButtonWidget({Key? key,
    required this.buttonText,
    required this.shapeBorder,
    required this.onPressed,
    required this.buttonColor, })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed,
      style:ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(color: buttonColor)
            )
        ),
      ),
      child: Text(buttonText, style: const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: Colors.white,
      )),
    );

  }
}