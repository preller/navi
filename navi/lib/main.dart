import 'package:flutter/material.dart';
import 'package:navi/blocs/bloc_provider.dart';
import 'package:navi/blocs/room_bloc.dart';
import 'package:navi/pages/splashscreen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:dynamic_theme/dynamic_theme.dart';

import 'package:navi/services/localization.dart';

Future<void> main() async  {
  return runApp(NaviApp());
}

// App with entry point at Spalshscreen()
class NaviApp extends StatelessWidget {
  final RoomsBloc bloc;

  NaviApp({
    Key key,
    this.bloc
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new DynamicTheme(
      defaultBrightness: Brightness.light,
      data: (brightness) => new ThemeData(
        primarySwatch: Colors.blue,
        brightness: brightness,
      ),
      themedWidgetBuilder: (context, theme) {
        return BlocProvider<RoomsBloc>( // provides layered blocs access to the app, as the app grows
          bloc: RoomsBloc(), // we just do more layering
          child: MaterialApp(
            localizationsDelegates: [
              AppLocalizationsDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate
            ],
            supportedLocales: [Locale('en', ""), Locale('de', "")],
            title: 'Navi',
            debugShowCheckedModeBanner: false,
            theme: theme,
            home: Splashscreen(),
          )
        );
      }
    );
  }
}
