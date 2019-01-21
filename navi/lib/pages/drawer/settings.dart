import 'package:flutter/material.dart';
import 'dart:async';
import 'package:navi/services/localization.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.darkThemeEnabled,
      initialData: false,
      builder: (context, snapshot) => MaterialApp(
          theme: snapshot.data ? ThemeData.dark() : ThemeData.light(),
          home: SettingsPage(snapshot.data)),
    );
  }
}

class SettingsPage extends StatelessWidget {
  final bool darkThemeEnabled;

  SettingsPage(this.darkThemeEnabled);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).settingsText),
        ),
      body: Container(
        padding: new EdgeInsets.only(left: 8.0),
        child: Row(
          children: <Widget>[
            Text(AppLocalizations.of(context).darkThemeText),
            Switch(
              value: darkThemeEnabled,
              onChanged: bloc.changeTheme,
            )
          ]
        )
      )
    );
  }
}

class Bloc {
  final _themeController = StreamController<bool>.broadcast();
  get changeTheme => _themeController.sink.add;
  get darkThemeEnabled => _themeController.stream;
}

final bloc = Bloc();
