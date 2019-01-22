import 'package:flutter/material.dart';
import 'package:dynamic_theme/dynamic_theme.dart';


class Settings extends StatelessWidget {
  bool darkThemeOn = false;

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
              onChanged: (val) {
                DynamicTheme.of(context).setBrightness(Theme.of(context)
                  .brightness == Brightness.dark? Brightness
                  .light: Brightness.dark);
                darkThemeOn = val;
              },
            ),
          ]
        )
      )
    );
  }

}


