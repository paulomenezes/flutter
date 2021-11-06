import 'package:persistence_example/data/ProfileDataSource.dart';
import 'package:persistence_example/model/Profile.dart';

abstract class ProfileRepository {
  Future<Profile?> getProfile();
  Future<bool> setProfile(Profile profile);
  Future<bool> deleteProfile();
}

class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRepositoryImpl(this.dataSource);

  final ProfileDataSource dataSource;

  @override
  Future<Profile?> getProfile() {
    return dataSource.getProfile();
  }

  @override
  Future<bool> deleteProfile() {
    return dataSource.deleteProfile();
  }

  @override
  Future<bool> setProfile(Profile profile) {
    return dataSource.setProfile(profile);
  }
}
