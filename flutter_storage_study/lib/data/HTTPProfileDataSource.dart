import 'dart:convert';

import 'package:persistence_example/model/Profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'ProfileDataSource.dart';

class HTTPProfileDataSource implements ProfileDataSource {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Future<bool> deleteProfile() async {
    return _prefs.then((prefs) {
      prefs.remove('name');
      prefs.remove('address');
      return true;
    }).catchError((error) {
      return false;
    });
  }

  @override
  Future<Profile?> getProfile() async {
    var response =
        await http.get(Uri.parse('https://profile.free.beeceptor.com'));

    if (response.statusCode == 200) {
      return Profile.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }

  @override
  Future<bool> setProfile(Profile profile) async {
    return _prefs.then((prefs) {
      prefs.setString("name", profile.name);
      prefs.setString("address", profile.address);

      return true;
    }).catchError((error) {
      return false;
    });
  }
}
