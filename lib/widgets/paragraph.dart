import 'package:flutter/material.dart';

class Paragraph extends StatelessWidget {
  final String _text;

  Paragraph(this._text);

  @override
  Widget build(BuildContext context) {
    final list = _text.split('\n');

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: list.map(_paragraph).toList(),
    );
  }

  Widget _paragraph(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Text(text, textAlign: TextAlign.justify),
    );
  }
}
