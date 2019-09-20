// Copyright 2019 The Privacy App Developers. All rights reserved.
// Use of this source code is governed by a MIT LICENSE
// Also read license file that can be found in the LICENSE file.

import 'dart:convert';
import 'dart:ui';

import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;
  Map<String, Map<String, dynamic>> _localizedValues;

  AppLocalizations(this.locale) {
    _localizedValues = _localizedData;
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  String get welcome {
    return _localizedValues[locale.languageCode]['welcome'];
  }

  String get wizardIntro {
    return _localizedValues[locale.languageCode]['wizardIntro'];
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

const Map<String, Map<String, dynamic>> _localizedData = {
  "en": {
    "welcome": "Welcome!",
    "wizardIntro":
        "The main Privacy Contacts App's goal is keeping your privacy with only you. Backed by AES encryption the App syncs only encrypted data. So it guaranties you that your privacy data is not collected, processed and analysed while storing in the cloud. \nUsing the same secret seed-phrase you can synchronize your contacts data across many devices without trusting service provider. \nThe project is Open Source and you can audit every line of code. \nYou must take care to keep your seed-phrase in strongly secret and use the App in safe environment.",
    "seedIntro":
        "Your encryption secret key is derived from special mnemonic code. \nA mnemonic code or sentence is superior for human interaction compared to the handling of raw binary or hexadecimal representations of secret keys. The sentence could be easy written on paper.",
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
};
