// This is a basic Flutter widget test.
// To perform an interaction with a widget in your test, use the WidgetTester utility that Flutter
// provides. For example, you can send tap and scroll gestures. You can also use WidgetTester to
// find child widgets in the widget tree, read text, and verify that the values of widget properties
// are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:navi/main.dart';
import 'package:navi/pages/homePage.dart';
import 'package:navi/services/localization.dart';
import 'package:mockito/mockito.dart';


import 'mocks.dart';

void main() {
  /**
   * A test case for testing homePage GUI.
   */
  testWidgets('Test homePage', (WidgetTester tester) async {
    //var bloc = MockBloc();
    // App localization object for handling different text languages
    AppLocalizations appLocalizations = await AppLocalizations.load(Locale('en', ""));

    Widget makeTestable ({Widget child}) {
      return MaterialApp(
        home: child,
      );
    }
    // Build our app and trigger a frame.
    await tester.pumpWidget(NaviApp());

    expect(find.text(appLocalizations.welcomeText), findsOneWidget);
    expect(find.text('SSC'), findsOneWidget);
    expect(find.text('Mensa'), findsOneWidget);
    expect(find.text('Aula'), findsOneWidget);
    expect(find.text(appLocalizations.pickPlace), findsOneWidget);
    expect(find.text(appLocalizations.favouriteText), findsOneWidget);
    expect(find.text(appLocalizations.accountText), findsOneWidget);
  });

  /**
   * A test case for testing rooms page GUI.
   */
  testWidgets('Test rooms', (WidgetTester tester) async {

    // App localization object for handling different text languages
    AppLocalizations appLocalizations = await AppLocalizations.load(Locale('en', ""));

    // Build our app and trigger a frame.
    await tester.pumpWidget(new NaviApp());

    // Click on 'Pick A Place'
    await tester.tap(find.text(appLocalizations.pickPlace));
    await tester.pump();

    expect(find.text('Scan'), findsOneWidget);
    expect(find.text('Select Room'), findsOneWidget);

    // Click on 'Select Room'
    await tester.tap(find.text('Select Room'));
    await tester.pump();

    expect(find.text('A108'), findsOneWidget);
    expect(find.text('A109'), findsOneWidget);
    expect(find.text('B108'), findsOneWidget);
    expect(find.text('B114'), findsOneWidget);
  });
}
