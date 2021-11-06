import 'package:flutter/material.dart';

class ProfileForm extends StatefulWidget {
  const ProfileForm({Key? key, required this.onNameInserted, required this.onAddrInserted}) : super(key: key);

  final Function(String) onNameInserted;
  final Function(String) onAddrInserted;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProfileFormState(
        onNameInserted: onNameInserted,
        onAddrInserted: onAddrInserted
    );
  }
}

class _ProfileFormState extends State<ProfileForm> {
  _ProfileFormState(
      {required this.onNameInserted, required this.onAddrInserted});

  final profileNameInputController = TextEditingController();
  final profileAddrInputController = TextEditingController();
  final Function(String) onNameInserted;
  final Function(String) onAddrInserted;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: <Widget>[
            Expanded(
                child: TextField(
                  controller: profileNameInputController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Configurar nome"),
                )),
            ElevatedButton(
                onPressed: () =>
                {
                  onNameInserted(profileNameInputController.text),
                  profileNameInputController.clear()
                },
                child: Text("Ok"))
          ],
        ),
        Row(
          children: [
            Expanded(
                child: TextField(
                  controller: profileAddrInputController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Configurar endereço"),
                )),
            ElevatedButton(
                onPressed: () =>
                {
                  onAddrInserted(profileAddrInputController.text),
                  profileAddrInputController.clear()
                },
                child: Text("Ok"))
          ],
        )
      ],
    );
  }
}
