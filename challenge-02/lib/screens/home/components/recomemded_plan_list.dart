import 'package:challenge_ui_plant_app/constants.dart';
import 'package:challenge_ui_plant_app/models/plant.dart';
import 'package:flutter/material.dart';

import 'recommend_plan_card.dart';

class RecomemdedPlantList extends StatelessWidget {
  final Function onFavorite;
  final bool isFavorited;
  List<Plant> plants = [];

  RecomemdedPlantList(
      {Key? key,
      required this.plants,
      required this.onFavorite,
      required this.isFavorited})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) => Row(children: [
              const SizedBox(width: kDefaultPadding),
              RecomendedPlanCard(
                plant: plants[index],
                onFavorite: onFavorite,
                isFavorited: isFavorited,
                isGrid: false,
              )
            ]),
            itemCount: plants.length,
          ))
    ]);
  }
}
