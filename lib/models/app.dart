// Copyright 2019 The Privacy App Developers. All rights reserved.
// Use of this source code is governed by a MIT LICENSE
// Also read license file that can be found in the LICENSE file.

import 'package:contacts/models/theme.dart';

final appModel = AppModel();

class AppModel {
  ThemeModel themeModel = ThemeModel();

  AppModel();

  Future<void> initialize() async {}
}
