// Copyright 2019 The Privacy App Developers. All rights reserved.
// Use of this source code is governed by a MIT LICENSE
// Also read license file that can be found in the LICENSE file.

import 'package:contacts/models/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

final appModel = AppModel();

class AppModel {
  ThemeModel themeModel = ThemeModel();
  String seed;

  AppModel();

  Future<void> initialize() async {
    // init the seed from persistent storage
    final prefs = await SharedPreferences.getInstance();
    seed = prefs.getString('mnemonic_seed');
  }
}
