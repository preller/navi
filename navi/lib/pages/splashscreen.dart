import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:navi/pages/homePage.dart';
import 'package:navi/localization.dart';

class Splashscreen extends StatefulWidget {
  @override
  _SplashscreenState createState() => new _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 10,
      navigateAfterSeconds: new HomePage(),
      title: new Text(AppLocalizations.of(context).splashscreenText,
        style: new TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0
        ),),
      image: new Image.network('https://flutter.io/images/catalog-widget-placeholder.png'),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: new TextStyle(),
      //onClick: new HomePage(),
      photoSize: 100.0,
      loaderColor: Colors.red,
    );
  }
}