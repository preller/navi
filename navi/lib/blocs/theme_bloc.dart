import 'dart:async';
import 'package:flutter/services.dart';

import 'package:navi/blocs/bloc_provider.dart';

class ThemeBloc implements BlocBase {
  bool _theme;

  StreamController<bool> _themeController = StreamController<bool>.broadcast();
  Sink<bool> get changeTheme => _themeController.sink;
  Stream<bool>  get darkThemeEnabled => _themeController.stream;

  dispose() {
    _themeController.close();
  }

  void changed (bool data){
    changeTheme.add(data);
  }
}
