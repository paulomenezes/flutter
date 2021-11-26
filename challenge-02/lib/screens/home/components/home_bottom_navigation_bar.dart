import 'package:challenge_ui_plant_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeBottomNagivationBar extends StatelessWidget {
  const HomeBottomNagivationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: kDefaultPadding * 4,
        right: kDefaultPadding * 4,
        bottom: kDefaultPadding
      ),
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -10),
            blurRadius: 35,
            color: kPrimaryColor.withOpacity(0.38)
          )
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(onPressed: () {}, icon: SvgPicture.asset("assets/icons/flower.svg")),
          IconButton(onPressed: () {}, icon: SvgPicture.asset("assets/icons/heart-icon.svg")),
        ],
      ),
    );
  }
}