import 'package:challenge_ui_plant_app/constants.dart';
import 'package:challenge_ui_plant_app/screens/home/components/home_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'components/home_bottom_navigation_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: buildAppBar(),
      body: HomeBody(),
      // bottomNavigationBar: const HomeBottomNagivationBar(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor,
      elevation: 0,
      leading: IconButton(
          icon: SvgPicture.asset("assets/icons/menu.svg"), onPressed: () {}),
    );
  }
}
