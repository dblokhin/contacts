// Copyright 2019 The Privacy App Developers. All rights reserved.
// Use of this source code is governed by a MIT LICENSE
// Also read license file that can be found in the LICENSE file.

import 'package:contacts/interfaces/localization.dart';
import 'package:contacts/models/app.dart';
import 'package:contacts/screens/contacts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  await appModel.initialize();

  final app = const ContactApp(
    child: ContactsScreen(),
  );

  runApp(app);
}

class ContactApp extends StatelessWidget {
  final Widget child;

  const ContactApp({Key key, @required this.child})
      : assert(child != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      showSemanticsDebugger: false,
      supportedLocales: [
        const Locale('en', ''),
      ],
      localizationsDelegates: [
        const AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      title: 'Privacy Contacts',
      theme: appModel.themeModel.theme,
      darkTheme: appModel.themeModel.darkTheme,
      themeMode: ThemeMode.system,
      home: child,
    );
  }
}
