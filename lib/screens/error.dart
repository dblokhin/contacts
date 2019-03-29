import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final Object e;

  ErrorScreen(this.e);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(e.toString())));
  }
}
