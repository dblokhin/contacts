import 'package:flutter/material.dart';

void alert(BuildContext context, text) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
          content: Text(
            text.toString(),
            style: Theme.of(context).textTheme.caption,
            textAlign: TextAlign.center,
          ),
        ),
  );
}

class CenterText extends StatelessWidget {
  final String text;
  final TextStyle style;

  CenterText(this.text, {this.style});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: style,
        textAlign: TextAlign.center,
      ),
    );
  }
}
