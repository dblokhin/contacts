import 'package:contacts/models/contacts.dart';
import 'package:contacts/screens/error.dart';
import 'package:contacts/screens/wizard.dart';
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
    state.add(AppInitState());

    SharedPreferences.getInstance().then((pref) {
      final seed = pref.get(seedStoreKey);
      if (seed == null) return openSeedWizard();

      SeedEncoder.applySeed(seed).then((_) => openBook());
    }).catchError((e) => openError(e));
  }

  /// screen navigation
  /// opens book screen
  openBook() {
    _screenBook = _screenBook ?? AppBookState();
    state.add(_screenBook);
  }

  /// opens error screen
  openError(e) {
    print('initialization app error: $e');
    state.add(AppErrorState(e));
  }

  /// opens seed wizard screen
  openSeedWizard() {
    state.add(AppSeedWizardState());
  }

  openSeedGenerationScreen(BuildContext context) {
    Navigator.of(context)
        .push(MyRoute(builder: (ctx) => WizardCreateSeedScreen()));
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

class AppSeedWizardState extends AppScreenState {
  final Widget screen = WizardScreen();
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
