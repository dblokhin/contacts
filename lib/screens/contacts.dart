// Copyright 2019 The Privacy App Developers. All rights reserved.
// Use of this source code is governed by a MIT LICENSE
// Also read license file that can be found in the LICENSE file.

import 'package:contacts/models/app.dart';
import 'package:contacts/ui/contacts.dart';
import 'package:flutter/material.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const <Widget>[
          ContactsAppBar(),
          Expanded(child: ContactsList()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.add),
      ),
      drawer: Drawer(),
    );
  }
}

class ContactsAppBar extends StatelessWidget {
  const ContactsAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String searchFieldLabel =
        MaterialLocalizations.of(context).searchFieldLabel;

    return Column(
      children: <Widget>[
        Container(
          height: 24,
          color: appModel.themeModel.primaryColor,
        ),
        const SizedBox(height: 4),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: AppBar(
            primary: false,
            title: Text(searchFieldLabel),
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ],
    );
  }
}
