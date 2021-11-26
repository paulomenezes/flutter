import 'package:challenge_ui_plant_app/constants.dart';
import 'package:flutter/material.dart';

class TitleWithButtonRow extends StatelessWidget {
  final String title;
  final String buttonText;
  final Function onPressed;

  const TitleWithButtonRow({
    Key? key,
    required this.title,
    required this.onPressed,
    required this.buttonText
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        children: [
          TitleWithCustomUnderline(text: title),
          const Spacer(),
          ElevatedButton(
            onPressed: () { onPressed(); },
            child: Text(buttonText, style: const TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              primary: kPrimaryColor
            )
            
          )
        ],
      ),
    );
  }
}

class TitleWithCustomUnderline extends StatelessWidget {
  final String text;

  const TitleWithCustomUnderline({
    Key? key, required this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      child: Stack(
        children: [
          Padding(padding: const EdgeInsets.only(left: kDefaultPadding/4),
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold)
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: const EdgeInsets.only(left: kDefaultPadding / 4),
              height: 7,
              color: kPrimaryColor.withOpacity(0.2),
            )
          )
        ],
      ),
    );
  }
}