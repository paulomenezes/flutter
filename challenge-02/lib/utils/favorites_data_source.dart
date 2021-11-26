import 'dart:convert';

import 'package:challenge_ui_plant_app/models/plant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesDataSource {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  List<String> _favorites = [];

  bool isFavorite(String id) {
    return _favorites.contains(id);
  }

  Future<bool> isFavorited(String id) async {
    return _prefs.then((prefs) {
      var favorites = prefs.getStringList("favorites") ?? [];

      return favorites.contains(id);
    }).catchError((error) {
      return false;
    });
  }

  Future<List<String>> getFavorite() async {
    return _prefs.then((prefs) {
      var favorites = prefs.getStringList("favorites") ?? [];

      return favorites;
    }).catchError((error) {
      return _favorites;
    });
  }

  Future<List<String>> toggleFavorite(String id) async {
    return _prefs.then((prefs) {
      var favorites = prefs.getStringList("favorites") ?? [];

      if (favorites.contains(id)) {
        favorites.remove(id);
      } else {
        favorites.add(id);
      }

      _favorites = favorites;

      prefs.setStringList("favorites", favorites);

      return favorites;
    }).catchError((error) {
      return _favorites;
    });
  }

  Future<List<Plant>> getPlants() async {
    return _prefs.then((prefs) {
      var plantsString = prefs.getString("plants");

      if (plantsString != null) {
        List<Plant> plants = json
            .decode(plantsString)
            .map<Plant>((plant) => Plant.fromJson(plant))
            .toList();

        return plants;
      }

      return [] as List<Plant>;
    }).catchError((error) {
      return [] as List<Plant>;
    });
  }

  Future<bool> setPlants(List<Plant> plants) async {
    return _prefs.then((prefs) {
      prefs.setString("plants", jsonEncode(plants));

      return true;
    }).catchError((error) {
      return false;
    });
  }
}
