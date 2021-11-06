import 'package:flutter/material.dart';
import 'package:persistence_example/data/FileProfileDataSource.dart';
import 'package:persistence_example/data/HTTPProfileDataSource.dart';
import 'package:persistence_example/data/KeyValueProfileDataSource.dart';
import 'package:persistence_example/data/SQLProfileDataSource.dart';
import 'package:persistence_example/model/Profile.dart';
import 'package:persistence_example/repository/ProfileRepository.dart';

import 'components/ProfileForm.dart';
import 'components/ProfilePanel.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Profile? profile;

  final ProfileRepository repo = ProfileRepositoryImpl(HTTPProfileDataSource());

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Meu perfil "),
        ),
        body: Column(
          children: <Widget>[
            if (profile != null)
              ProfilePanel(
                profile: profile!,
                onDeleteProfileClicked: _handleProfileDelete,
              ),
            ProfileForm(
                onNameInserted: _handleNameInserted,
                onAddrInserted: _handleAddrInserted)
          ],
        ));
  }

  void _loadProfile() async {
    final Profile? profile = await repo.getProfile();

    if (profile != null)
      setState(() {
        this.profile = profile;
      });
  }

  void _handleNameInserted(String text) async {
    Profile copy =
        Profile(id: profile?.id, name: text, address: profile?.address ?? "");

    final bool success = await repo.setProfile(copy);
    if (success)
      setState(() {
        this.profile = copy;
      });
  }

  void _handleAddrInserted(String text) async {
    Profile copy =
        Profile(id: profile?.id, name: profile?.name ?? "", address: text);

    final bool success = await repo.setProfile(copy);
    if (success)
      setState(() {
        this.profile = copy;
      });
  }

  void _handleProfileDelete() async {
    final bool success = await repo.deleteProfile();
    if (success)
      setState(() {
        profile = null;
      });
  }
}
