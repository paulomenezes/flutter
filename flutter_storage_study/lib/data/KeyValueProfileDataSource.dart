import 'package:persistence_example/model/Profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ProfileDataSource.dart';

class KeyValueProfileDataSource implements ProfileDataSource {
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
    return _prefs.then((prefs) {
      var name = prefs.getString("name");
      var address = prefs.getString("address");

      if (name != null && address != null) {
        return Profile(name: name, address: address);
      }

      return null;
    }).catchError((error) {
      return null;
    });
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
