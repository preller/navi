import 'package:flutter/material.dart';
import 'package:navi/blocs/bloc_provider.dart';
import 'package:navi/blocs/room_bloc.dart';
import 'package:navi/pages/POI.dart';
import 'package:navi/pages/drawer/sidedrawer.dart';
import 'package:navi/pages/rooms.dart';
import 'package:navi/pages/drawer/account.dart';
import 'package:navi/pages/drawer/settings.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:navi/blocs/pathFinders/Pathfinder.dart';

import 'package:navi/services/localization.dart';

class HomePage extends StatefulWidget {
  RoomsBloc bloc;

  HomePage({
    Key key,
    this.bloc
  }) : super(key: key);

  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    widget.bloc = BlocProvider.of<RoomsBloc>(context);
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(title: Text('Navi')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(AppLocalizations.of(context).welcomeText, style: TextStyle(fontSize: 24.0)),

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
                    _doScan(context);
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)
                  ),
                  color: Colors.lightBlueAccent,
                ),
                RaisedButton(
                  child: Text('Mensa', style: TextStyle(color: Colors.white, fontSize: 16.0)),
                  onPressed: () {
                    _doScan(context);
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)
                  ),
                  color: Colors.orange,
                ),
                RaisedButton(
                  child: Text('Aula', style: TextStyle(color: Colors.white, fontSize: 16.0)),
                  onPressed: (){
                    _doScan(context);
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
                      AppLocalizations.of(context).pickPlace,
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
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            title: Text(AppLocalizations.of(context).accountText),
            icon: Icon(FontAwesomeIcons.user),
          ),
          BottomNavigationBarItem(
            title: Text(AppLocalizations.of(context).settingsText),
            icon: Icon(FontAwesomeIcons.cogs),
          )
        ],
        onTap: (currentIndex) {
          currentIndex == 0 ? _openAccountsPage(context) : _openSettingsPage(context);
        },
        //fixedColor: Colors.blue,
        //currentIndex: 0,
      ),
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

  void _openAccountsPage(BuildContext context) {
    Navigator
      .of(context)
      .push(MaterialPageRoute(builder: (BuildContext context) {
      return BlocProvider<RoomsBloc>(
        bloc: RoomsBloc(),
        child: AccountPage(),
      );
    }));
  }

  void _openSettingsPage(BuildContext context) {
    Navigator
      .of(context)
      .push(MaterialPageRoute(builder: (BuildContext context) {
      return BlocProvider<RoomsBloc>(
        bloc: RoomsBloc(),
        child: Settings(),
      );
    }));
  }

  void _doScan(BuildContext context) {
    widget.bloc.scanQR();
    Navigator
      .of(context)
      .push(MaterialPageRoute(builder: (BuildContext context) {
      return BlocProvider<RoomsBloc>(
        bloc: RoomsBloc(),
        child: PoiPage(),
      );
    }));
  }
}
