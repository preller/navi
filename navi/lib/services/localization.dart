import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'l10n/messages_all.dart';

class AppLocalizations {
  static Future<AppLocalizations> load(Locale locale) {
    final String name =
    locale.countryCode == null ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return new AppLocalizations();
    });
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  String get welcomeText {
    return Intl.message('Where Do You Want To Go?',
        name: 'welcomeText', desc: 'The welcome text');
  }

  String get pickPlace {
    return Intl.message('Pick A Place', name: 'pickPlace');
  }

  String get settingsText {
    return Intl.message('Settings', name: 'settingsText');
  }

  String get accountText {
    return Intl.message('My Account', name: 'accountText');
  }

  String get signInText {
    return Intl.message('Sign In', name: 'signInText');
  }

  String get logInButton {
    return Intl.message('Log In as a Guest', name: 'logInButton');
  }

  String get logOutButton {
    return Intl.message('Log Out', name: 'logOutButton');
  }

  String get darkThemeText {
    return Intl.message('Switch to Dark Theme', name: 'darkThemeText');
  }

  String get findRoomText {
    return Intl.message('Find A Room', name: 'findRoomText');
  }

  String get dropDownRoomText {
    return Intl.message('Select A Room', name: 'dropDownRoomText');
  }

  String get backText {
    return Intl.message('Back', name: 'backText');
  }

  String get nextText {
    return Intl.message('Next', name: 'nextText');
  }

  String get finishText {
    return Intl.message('Finish', name: 'finishText');
  }

  String get gotItText {
    return Intl.message('Okay, got it!', name: 'gotItText');
  }

  String get rogerText {
    return Intl.message('Roger that!', name: 'rogerText');
  }

  String get notificationLogInText {
    return Intl.message('You have been signed in anonymously', name: 'notificationLogInText');
  }

  String get notificationLogOutText {
    return Intl.message('You have been signed out', name: 'notificationLogOutText');
  }

  String get favouriteText {
    return Intl.message('Favourites', name: 'favouriteText');
  }

  String get splashscreenText {
    return Intl.message('Welcome to Navi', name: 'splashscreenText');
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'de'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    return AppLocalizations.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) {
    return false;
  }
}