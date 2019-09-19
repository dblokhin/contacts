// Copyright 2019 The Privacy App Developers. All rights reserved.
// Use of this source code is governed by a MIT LICENSE
// Also read license file that can be found in the LICENSE file.

import 'package:flutter/material.dart';

class Paragraph extends StatelessWidget {
  final String text;

  const Paragraph(this.text, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final list = text.split('\n');

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: list.map(_paragraph).toList(),
    );
  }

  Widget _paragraph(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Text('  $text', textAlign: TextAlign.justify),
    );
  }
}
