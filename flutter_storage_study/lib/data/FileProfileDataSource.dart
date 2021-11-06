import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:persistence_example/model/Profile.dart';

import 'ProfileDataSource.dart';

class FileProfileDataSource implements ProfileDataSource {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/profile.txt');
  }

  @override
  Future<bool> deleteProfile() async {
    final file = await _localFile;
    await file.delete();

    return true;
  }

  @override
  Future<Profile?> getProfile() async {
    try {
      final file = await _localFile;
      final contents = await file.readAsString();

      var profileParts = contents.split("|");

      if (profileParts.length == 2) {
        return new Profile(name: profileParts[0], address: profileParts[1]);
      }

      return null;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool> setProfile(Profile profile) async {
    final file = await _localFile;
    file.writeAsString('${profile.name}|${profile.address}');

    return true;
  }
}
