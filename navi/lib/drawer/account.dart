import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

class AccountPage extends StatelessWidget {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<FirebaseUser> signInAnon() async {
    FirebaseUser user = await firebaseAuth.signInAnonymously();
    print("Signed in ${user.uid}");
    return user;
  }

  Widget _signedInDialog(BuildContext context) {
    return new AlertDialog(
      title: const Text('You have been signed in anonymously'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Roger that!'),
        ),
      ],
    );
  }

  Widget _signedOutDialog(BuildContext context) {
    return new AlertDialog(
      title: const Text('You have been signed out'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Okay, got it!'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final loginbutton = Container(
      padding: EdgeInsets.all(10.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.deepOrange,
        elevation: 10.0,
        child: MaterialButton(
          minWidth: 150.0,
          height: 50.0,
          color: Colors.orange,
          child: Text('Sign in as Guest'),
          onPressed: () {
            signInAnon().then((FirebaseUser user) {
              Navigator
              .of(context)
              .push(MaterialPageRoute(
              builder: (BuildContext context) => _signedInDialog(context),
              )
              )
              .catchError((e) => print(e));
            });
          },
      ),
    )
    );

    final logoutButton = Container(
      padding: EdgeInsets.all(10.0),
      child: FlatButton(
        color: Colors.white,
        onPressed: () {
          firebaseAuth.signOut();
          Navigator
              .of(context)
              .push(MaterialPageRoute(
              builder: (BuildContext context) => _signedOutDialog(context),
            )
          );
        },
        child: Text(
          "Sign Out",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Log in"),
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(10.0),
          children: <Widget>[
            loginbutton,
            logoutButton,
          ],
        ),
      ),
    );
  }
}
