import 'package:flutter/material.dart';

class CreditCard extends StatelessWidget {
  final BoxDecoration decoration;
  final String image;
  final String number;
  final String name;
  final Widget vendor; //supposed to be a widget

  const CreditCard({
    required this.decoration,
    required this.image,
    required this.number,
    required this.name,
    required this.vendor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        width: 300,
        height: 300,
        decoration: decoration,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: vendor,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      number,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      name,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Image.asset(
                  image,
                  height: 50,
                  color: Colors.white,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}