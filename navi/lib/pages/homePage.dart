import 'package:flutter/material.dart';
import 'package:navi/blocs/bloc_provider.dart';
import 'package:navi/blocs/room_bloc.dart';
import 'package:navi/pages/room.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Navi')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              child: Text('Rooms'),
              onPressed: () {
                _openRoomsPage(context);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          title: Text('Rooms'),
          icon: Icon(Icons.pin_drop),
        ),
        BottomNavigationBarItem(
          title: Text('Favourites'),
          icon: Icon(Icons.pin_drop),
        ),
      ]),
    );
  }


  void _openRoomsPage(BuildContext context) {
    Navigator
        .of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return BlocProvider<RoomsBloc>(
        bloc: RoomsBloc(),
        child: RoomsPage(),
      );
    }));
  }
/*
  void _openOnePage(BuildContext context) {
    Navigator
        .of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return BlocProvider<MovieCatalogBloc>(
        bloc: MovieCatalogBloc(),
        child: ListOnePage(),
      );
    }));
  }
}*/
