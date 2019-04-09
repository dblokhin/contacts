// Copyright 2019 The Privacy App Developers. All rights reserved.
// Use of this source code is governed by a MIT LICENSE
// Also read license file that can be found in the LICENSE file.

import 'package:contacts/widgets/popular.dart';
import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final Object e;

  ErrorScreen(this.e);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: CenterText(e.toString()));
  }
}
