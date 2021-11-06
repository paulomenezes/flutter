import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:persistence_example/model/Profile.dart';
import 'package:sqflite/sqflite.dart';

import 'ProfileDataSource.dart';

class SQLProfileDataSource implements ProfileDataSource {
  Future<Database> get database async {
    WidgetsFlutterBinding.ensureInitialized();

    final database = openDatabase(
      join(await getDatabasesPath(), 'profiles.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE profiles(id INTEGER PRIMARY KEY, name TEXT, address TEXT)',
        );
      },
      version: 1,
    );

    return database;
  }

  @override
  Future<bool> deleteProfile() async {
    final db = await database;

    await db.delete(
      'profiles',
    );

    return true;
  }

  @override
  Future<Profile?> getProfile() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('profiles');

    return Profile(
      name: maps.last['name'],
      address: maps.last['address'],
    );
  }

  @override
  Future<bool> setProfile(Profile profile) async {
    final db = await database;

    await db.insert(
      'profiles',
      profile.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return true;
  }
}
