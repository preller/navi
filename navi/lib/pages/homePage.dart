import 'package:flutter/material.dart';
import 'package:navi/blocs/bloc_provider.dart';
import 'package:navi/blocs/room_bloc.dart';
import 'package:navi/drawer/sidedrawer.dart';
import 'package:navi/pages/rooms.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(title: Text('Navi')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text('Where Do You Want To Go?', style: TextStyle(fontSize: 24.0)),

            // These buttons are suggestions that change to users favourites later
            // they lead to a sample page for now but the plan is too lead to the camera
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  child: Text(
                    'SSC',
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                  onPressed: () {
                    _openRoomsPage(context);
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)
                  ),
                  color: Colors.lightBlueAccent,
                ),
                RaisedButton(
                  child: Text('Mensa', style: TextStyle(color: Colors.white, fontSize: 16.0)),
                  onPressed: () {
                    _openRoomsPage(context);
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)
                  ),
                  color: Colors.orange,
                ),
                RaisedButton(
                  child: Text('Aula', style: TextStyle(color: Colors.white, fontSize: 16.0)),
                  onPressed: (){
                    _openRoomsPage(context);
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)
                  ),
                  color: Colors.deepOrange,
                ),
              ]
            ),
            Column(
              //mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  // this button leads to the picker
                  ButtonTheme(
                    minWidth: 200.0,
                    height: 50.0,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)
                      ),
                      child: Text(
                        'Pick A Place',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                      onPressed: (){
                        _openRoomsPage(context);
                      },
                      color: Colors.lightBlue,
                      splashColor: Colors.lightBlueAccent,
                    )
                  ),
                ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          title: Text('Favourites'),
          icon: Icon(FontAwesomeIcons.heart),
        ),
        BottomNavigationBarItem(
          title: Text('My Account'),
          icon: Icon(FontAwesomeIcons.user),
        ),
      ]),
    );
  }

/*
hook up rooms bloc to rooms page inside a navigator
 */
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
}
