import 'dart:convert';

import 'package:challenge_ui_plant_app/models/grid_arguments.dart';
import 'package:challenge_ui_plant_app/models/plant.dart';
import 'package:challenge_ui_plant_app/utils/favorites_data_source.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'header_with_searchbox.dart';
import 'recomemded_plan_list.dart';
import 'title_with_button_row.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final FavoritesDataSource dataSource = FavoritesDataSource();

  List<Plant> plants = [];
  List<Plant> nonFavoriteplants = [];
  List<Plant> favoritePlants = [];

  @override
  void initState() {
    super.initState();

    http
        .get(Uri.parse("https://study-web-app.herokuapp.com/plants"))
        .then((value) {
      plants = json
          .decode(value.body)
          .map<Plant>((plant) => Plant.fromJson(plant))
          .toList();

      dataSource.setPlants(plants);
      updateFavorites();
      setState(() {});
    }).catchError((error) {
      dataSource.getPlants().then((value) {
        plants = value;
        updateFavorites();
        setState(() {});
      });
    });
  }

  void updateFavorites() {
    dataSource.getFavorite().then((value) {
      favoritePlants =
          plants.where((plant) => value.contains(plant.id)).toList();

      nonFavoriteplants =
          plants.where((plant) => !value.contains(plant.id)).toList();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return SizedBox(
        child: Column(
      verticalDirection: VerticalDirection.down,
      children: [
        HeaderWithSearchBox(screenSize: screenSize),
        Expanded(
            child: SingleChildScrollView(
          child: Column(
            children: [
              TitleWithButtonRow(
                title: "Favorite Plants",
                buttonText: "More",
                onPressed: () {
                  Navigator.pushNamed(context, '/grid',
                      arguments: GridArguments("favorites", favoritePlants));
                },
              ),
              RecomemdedPlantList(
                plants: favoritePlants,
                onFavorite: () {
                  updateFavorites();
                },
              ),
              TitleWithButtonRow(
                title: "All Plants",
                buttonText: "More",
                onPressed: () {
                  Navigator.pushNamed(context, '/grid',
                      arguments: GridArguments("all", nonFavoriteplants));
                },
              ),
              RecomemdedPlantList(
                plants: nonFavoriteplants,
                onFavorite: () {
                  updateFavorites();
                },
              ),
            ],
          ),
        ))
      ],
    ));
  }
}
