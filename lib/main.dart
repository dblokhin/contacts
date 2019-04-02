import 'package:contacts/interfaces/localization.dart';
import 'package:contacts/models/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(ContactApp());

final firstTheme = ThemeData(
  // Define the default Brightness and Colors
  primaryColor: Colors.lightBlue,
  accentColor: Colors.amber[800],
);

final alterTheme = ThemeData(
  // Define the default Brightness and Colors
  primaryColor: Colors.amber[800],
  accentColor: Colors.blue,
);

class ContactApp extends StatelessWidget {
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
      theme: firstTheme,
      home: SafeArea(child: Contacts()),
    );
  }
}

class Contacts extends StatefulWidget {
  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> with WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    // if state RESUMED (back to foreground)
    if (state == AppLifecycleState.resumed) {
      // do something
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: appScreen.state,
      initialData: AppInitState(),
      builder: (BuildContext ctx, AsyncSnapshot<AppScreenState> snapshot) {
        if (snapshot.hasData) {
          final state = snapshot.data;
          return state.screen;
        }

        return Scaffold(
          body: Center(
            child: Text('Something went wrong: ${snapshot.error}'),
          ),
        );
      },
    );
  }
}
