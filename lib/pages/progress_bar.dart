import 'package:flutter/material.dart';

void main() => runApp(const ProgressBar ());

class ProgressBar extends StatelessWidget {
  const ProgressBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(' Progress Bar '),
        ),
        body: const Center(
            child: CircularProgressIndicatorApp()
        ),
      ),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class CircularProgressIndicatorApp extends StatelessWidget {
  const CircularProgressIndicatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      backgroundColor: Colors.red,
      strokeWidth: 8,);
  }
}