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

  String get seedWizard {
    return _localizedValues[locale.languageCode]['seedWizard'];
  }

  String get recreate {
    return _localizedValues[locale.languageCode]['recreate'];
  }

  String get next {
    return _localizedValues[locale.languageCode]['next'];
  }

  String get newSeed {
    return _localizedValues[locale.languageCode]['newSeed'];
  }

  String get copySeed {
    return _localizedValues[locale.languageCode]['copySeed'];
  }

  String get copiedSeed {
    return _localizedValues[locale.languageCode]['copiedSeed'];
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
		"seedIntro": "Privacy Contacts App is not about security your data — the main goal is keep your privacy with only you. Backed by AES encryption the App syncs only encrypted data. So it guaranties you that your privacy data is not collected, processed and analysed while storing in cloud. \\nUsing the same secret seed-phrase you can synchronize your contacts data across many devices without trusting service provider. \\nThe project is open source and you can audit every line of code. \\nYou must take care to keep your seed-phrase in strongly secret and use App in safe environment.",
		"haveYouSeed": "Do you have a seed-phrase?",
		"alreadyHaveSeed": "Yes, I have one",
		"createNewSeed": "No, create new",
		"seedWizard": "Seed Wizard",
		"recreate": "Recreate",
		"next": "Next",
		"newSeed": "New seed-phrase",
		"copySeed": "Copy seed to clipboard",
		"copiedSeed": "Copied"
	},
	"ru": {}
}
''';
