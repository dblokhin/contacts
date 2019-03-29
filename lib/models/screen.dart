import 'package:contacts/models/contacts.dart';
import 'package:contacts/screens/error.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:seed_encoder/seed_encoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:contacts/screens/splash.dart';
import 'package:contacts/screens/book.dart';

final appScreen = AppScreen();
final bookScreen = BookScreenModel();

class AppScreen {
  final state = BehaviorSubject<AppScreenState>();

  AppScreenState _screenBook;

  close() {
    state.close();
  }

  AppScreen() {
    SharedPreferences.getInstance()
        .then((pref) {
          // init seed
          final seed = pref.get(seedStoreKey);
          return SeedEncoder.applySeed(seed);
        })
        .then((_) => openBook())
        .catchError((e) => openError(e));
  }

  // screen navigation
  openBook() {
    _screenBook = _screenBook ?? AppBookState();
    state.add(_screenBook);
  }

  openError(e) {
    print('initialization app error: $e');
    state.add(AppErrorState(e));
  }
}

class AppScreenState {
  final Widget screen = Container();
}

class AppInitState extends AppScreenState {
  final Widget screen = SplashScreen();
}

class AppErrorState extends AppScreenState {
  final Object e;
  final Widget screen;

  AppErrorState(this.e) : screen = ErrorScreen(e);
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

class BookScreenModel {
  final state = BehaviorSubject<BookScreenState>();

  close() {
    state.close();
  }

  BookScreenModel() {
    contactsModel.state.listen((list) => state.add(BookListState(list)));
    contactsModel.state.onAddError((e) => state.add(BookErrorState(e)));
  }
}

class BookScreenState {}

class BookInitState extends BookScreenState {}

class BookErrorState extends BookScreenState {
  Object error;

  BookErrorState(this.error);
}

class BookListState extends BookScreenState {
  final List<Contact> contacts;

  BookListState(this.contacts);
}
