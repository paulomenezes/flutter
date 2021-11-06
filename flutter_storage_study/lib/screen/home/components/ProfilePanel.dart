import 'package:flutter/material.dart';
import 'package:persistence_example/model/Profile.dart';

class ProfilePanel extends StatelessWidget {
  const ProfilePanel(
      {Key? key, required this.profile, required this.onDeleteProfileClicked})
      : super(key: key);

  final Profile profile;
  final Function() onDeleteProfileClicked;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.person),
            title: Text(profile.name),
            subtitle: Text(profile.address),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                  style: TextButton.styleFrom(primary: Colors.red),
                  onPressed: () => onDeleteProfileClicked(),
                  child: const Text("Remover")),
              const SizedBox(width: 8),
              TextButton(onPressed: () => {}, child: const Text("Editar")),
              const SizedBox(width: 8),
            ],
          )
        ],
      ),
    );
  }
}
