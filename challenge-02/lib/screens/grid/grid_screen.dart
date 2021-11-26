import 'package:challenge_ui_plant_app/constants.dart';
import 'package:challenge_ui_plant_app/models/grid_arguments.dart';
import 'package:challenge_ui_plant_app/screens/home/components/home_body.dart';
import 'package:challenge_ui_plant_app/screens/home/components/recommend_plan_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GridScreen extends StatelessWidget {
  const GridScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as GridArguments;
    final plants = args.plants;

    return Scaffold(
        appBar: buildAppBar(context, args.type),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: kDefaultPadding,
            mainAxisSpacing: kDefaultPadding,
            childAspectRatio: 0.8,
          ),
          padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding, vertical: kDefaultPadding),
          itemBuilder: (context, index) => RecomendedPlanCard(
            plant: plants[index],
            onFavorite: () {},
          ),
          itemCount: plants.length,
        ));
  }

  AppBar buildAppBar(BuildContext context, String type) {
    return AppBar(
      title: Text(type == 'favorites' ? "Favorites" : "All Plants"),
      backgroundColor: kPrimaryColor,
      elevation: 0,
      leading: IconButton(
          icon: SvgPicture.asset("assets/icons/back_arrow.svg"),
          onPressed: () {
            Navigator.pop(context);
          }),
    );
  }
}
