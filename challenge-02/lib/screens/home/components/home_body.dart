import 'dart:io';

import 'package:challenge_ui_plant_app/models/grid_arguments.dart';
import 'package:challenge_ui_plant_app/providers/plant_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'header_with_searchbox.dart';
import 'recomemded_plan_list.dart';
import 'title_with_button_row.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return SizedBox(
        child: Column(
      verticalDirection: VerticalDirection.down,
      children: [
        HeaderWithSearchBox(screenSize: screenSize),
        Consumer<PlantProvider>(
            builder: (context, plantProvider, child) => SingleChildScrollView(
                  child: Column(
                    children: [
                      TitleWithButtonRow(
                        title: "Favorite Plants",
                        buttonText: "More",
                        onPressed: () {
                          Navigator.pushNamed(context, '/grid',
                              arguments: GridArguments(
                                  "favorites", plantProvider.favoritePlants));
                        },
                      ),
                      RecomemdedPlantList(
                        plants: plantProvider.favoritePlants,
                      ),
                      TitleWithButtonRow(
                        title: "All Plants",
                        buttonText: "More",
                        onPressed: () {
                          Navigator.pushNamed(context, '/grid',
                              arguments: GridArguments(
                                  "all", plantProvider.nonFavoriteplants));
                        },
                      ),
                      RecomemdedPlantList(
                        plants: plantProvider.nonFavoriteplants,
                      ),
                    ],
                  ),
                ))
      ],
    ));
  }
}
