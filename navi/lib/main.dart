import 'package:flutter/material.dart';
import 'package:navi/blocs/bloc_provider.dart';
import 'package:navi/blocs/room_bloc.dart';
import 'package:navi/pages/homePage.dart';


Future<void> main() async  {
  return runApp(
    BlocProvider<RoomsBloc>( // provides layered blocs access to the app, as the app grows
      bloc: RoomsBloc(), // we just do more layering
      child: MyApp()
    )
  );
}

// MyApp with entry point at HomePage()
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

