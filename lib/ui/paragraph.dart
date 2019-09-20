// Copyright 2019 The Privacy App Developers. All rights reserved.
// Use of this source code is governed by a MIT LICENSE
// Also read license file that can be found in the LICENSE file.

import 'package:flutter/material.dart';

class Paragraph extends StatelessWidget {
  final String text;
  final int indent;

  const Paragraph(this.text, {Key key, this.indent = 4}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final list = text.split('\n');
    final indention = ' ' * indent;

    final p = (String paragraph) => Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text('$indention$paragraph', textAlign: TextAlign.justify),
        );

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: list.map(p).toList(),
    );
  }
}
