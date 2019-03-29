import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:contacts/screens/splash.dart';
import 'package:contacts/screens/book.dart';

final appScreen = AppScreen();

class AppScreen {
  final state = BehaviorSubject<AppScreenState>();

  AppScreenState _screenBook;

  close() {
    state.close();
  }

  AppScreen() {
    SharedPreferences.getInstance().then((pref) {
      openBook();
    });
  }

  // screen navigation
  openBook() {
    _screenBook = _screenBook ?? AppBookState();
    state.add(_screenBook);
  }
}

class AppScreenState {
  final Widget screen = Container();
}

class AppInitState extends AppScreenState {
  final Widget screen = SplashScreen();
}

class AppBookState extends AppScreenState {
  final Widget screen = BookScreen();
}

class MyRoute<T> extends MaterialPageRoute<T> {
  MyRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return child;
  }
}
