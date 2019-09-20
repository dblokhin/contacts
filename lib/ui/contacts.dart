// Copyright 2019 The Privacy App Developers. All rights reserved.
// Use of this source code is governed by a MIT LICENSE
// Also read license file that can be found in the LICENSE file.

import 'package:contacts/models/contacts.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatelessWidget {
  const ContactsList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (_, __) => _contactItem(),
    );
  }

  Widget _contactItem() {
    final contact = Contact(name: 'Name', lastName: 'LastName', id: '3');
    return ListTile(
      leading: Icon(Icons.person_pin),
      title: Text(contact.name),
    );
  }
}
