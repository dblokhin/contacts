import 'dart:convert';
import 'dart:ui';

import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;
  Map<String, Map<String, dynamic>> _localizedValues;

  AppLocalizations(this.locale) {
    final Map<String, dynamic> input = json.decode(_localizedData);
    _localizedValues = input.cast<String, Map<String, dynamic>>();
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  String get welcome {
    return _localizedValues[locale.languageCode]['welcome'];
  }

  String get seedIntro {
    return _localizedValues[locale.languageCode]['seedIntro'];
  }

  String get haveYouSeed {
    return _localizedValues[locale.languageCode]['haveYouSeed'];
  }

  String get alreadyHaveSeed {
    return _localizedValues[locale.languageCode]['alreadyHaveSeed'];
  }

  String get createNewSeed {
    return _localizedValues[locale.languageCode]['createNewSeed'];
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}

final _localizedData = '''
{
	"en": {
		"welcome": "Welcome",
		"seedIntro": "Seed phrase is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English",
		"haveYouSeed": "Have you a seed?",
		"alreadyHaveSeed": "Yes, I have one",
		"createNewSeed": "Create new seed"
	},
	"ru": {}
}
''';