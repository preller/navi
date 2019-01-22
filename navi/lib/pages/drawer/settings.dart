
import 'package:flutter/material.dart';
import 'package:dynamic_theme/dynamic_theme.dart';

import 'dart:async';
import 'package:navi/services/localization.dart';

class Settings extends StatefulWidget {
  @override
  SettingsState createState() {
    return new SettingsState();
  }
}

class SettingsState extends State<Settings> {
  static bool darkThemeOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Container(
        padding: new EdgeInsets.only(left: 8.0),
        child: Row(
          children: <Widget>[
            Text("Switch to Dark Theme"),
            Switch(
              value: darkThemeOn,
              onChanged: (bool val) {
                DynamicTheme.of(context).setBrightness(Theme.of(context)
                  .brightness == Brightness.light? Brightness
                  .dark : Brightness.light);
                darkThemeOn = !darkThemeOn;
              },
            ),
          ]
        )
      )
    );
  }
}


