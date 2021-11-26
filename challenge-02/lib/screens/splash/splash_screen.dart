import 'package:challenge_ui_plant_app/constants.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 2500), () {
      Navigator.pushReplacementNamed(context, '/home');
    });

    return Container(
      color: kPrimaryColor,
      child: const Text(
        "FLUTTER \nPLANT \nAPP UI",
        style: TextStyle(
            color: Colors.white,
            decoration: TextDecoration.none,
            fontStyle: FontStyle.italic,
            fontSize: 40),
        textAlign: TextAlign.center,
      ),
      alignment: Alignment.center,
    );
  }
}
