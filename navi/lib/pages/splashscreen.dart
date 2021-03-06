import 'package:flutter/material.dart';
import 'package:navi/blocs/room_bloc.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:navi/pages/homePage.dart';
import 'package:navi/services/localization.dart';

class Splashscreen extends StatelessWidget {
  final RoomsBloc bloc;

  Splashscreen({
    Key key,
    this.bloc
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 10,
      navigateAfterSeconds: new HomePage(),
      title: new Text(AppLocalizations.of(context).splashscreenText,
        style: new TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 20.0,
        ),
        textAlign: TextAlign.center,
      ),
      image: new Image.asset('assets/icon/icon.png'),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: new TextStyle(),
      //onClick: new HomePage(),
      photoSize: 100.0,
      loaderColor: Colors.red,
    );
  }
}
