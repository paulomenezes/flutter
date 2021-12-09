import 'dart:convert';
import 'package:challenge_ui_plant_app/models/plant.dart';
import 'package:challenge_ui_plant_app/utils/favorites_data_source.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class PlantProvider extends ChangeNotifier {
  final FavoritesDataSource dataSource = FavoritesDataSource();

  List<Plant> plants = [];
  List<Plant> nonFavoriteplants = [];
  List<Plant> favoritePlants = [];

  PlantProvider() {
    loadPlants();
  }

  void loadPlants() {
    http
        .get(Uri.parse("https://study-web-app.herokuapp.com/plants"))
        .then((value) {
      plants = json
          .decode(value.body)
          .map<Plant>((plant) => Plant.fromJson(plant))
          .toList();

      dataSource.setPlants(plants);
      updateFavorites();

      notifyListeners();
    }).catchError((error) {
      dataSource.getPlants().then((value) {
        plants = value;
        updateFavorites();

        notifyListeners();
      });
    });
  }

  void updateFavorites() {
    dataSource.getFavorite().then((value) {
      favoritePlants =
          plants.where((plant) => value.contains(plant.id)).toList();

      nonFavoriteplants =
          plants.where((plant) => !value.contains(plant.id)).toList();

      notifyListeners();
    });
  }

  void favorite(String plantId) async {
    await dataSource.toggleFavorite(plantId);
    updateFavorites();
    notifyListeners();
  }

  bool isFavorited(String plantId) {
    return favoritePlants.any((plant) => plant.id == plantId);
  }
}
