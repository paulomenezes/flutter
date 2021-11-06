import 'package:persistence_example/model/Profile.dart';

abstract class ProfileDataSource {
  Future<Profile?> getProfile();
  Future<bool> setProfile(Profile profile);
  Future<bool> deleteProfile();
}
