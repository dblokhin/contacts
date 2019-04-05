// Copyright 2019 The Privacy App Developers. All rights reserved.
// Use of this source code is governed by a MIT LICENSE
// Also read license file that can be found in the LICENSE file.

import 'dart:convert';
import 'dart:typed_data';

import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:seed_encoder/seed_encoder.dart';
import 'package:uuid/uuid.dart';

final contactsModel = ContactsModel();
const contactsStorekey = '_privacyContacts';
const seedStoreKey = '_seed';

class ContactsModel {
  final state = BehaviorSubject<List<Contact>>();
  List<Contact> _contacts = [];

  close() {
    state.close();
  }

  ContactsModel() {
    state.add(_contacts);

    // init contact list
    SharedPreferences.getInstance()
        .then((pref) => _getRawContactsData(pref))
        .then((Uint8List raw) {
          // convert json
          final data = String.fromCharCodes(raw);
          final List parsed = json.decode(data);
          return parsed.map((x) => Contact.fromJson(x)).toList();
        })
        .then((contacts) => _contacts = contacts)
        .catchError(state.addError)
        .whenComplete(() => state.add(_contacts));
  }

  // Returns raw decrypted bytes from shared preferences storage
  // Raw data is json formatted contacts
  Future<Uint8List> _getRawContactsData(SharedPreferences pref) {
    final userEncryptedData = pref.getString(contactsStorekey);
    return SeedEncoder.decode(base64.decode(userEncryptedData));
  }

  // Creates Contact
  Contact create(String name, {String lastName}) {
    return Contact.newContact(name)..lastName = lastName;
  }

  // adds new or updates existing contact
  void commitContact(Contact contact) {
    final index = _contacts.indexWhere((c) => c.id == contact.id);
    if (index < 0) return;

    _contacts[index] = contact;

    // propagate result
    state.add(_contacts);
  }

  // deletes contact
  void deleteContact(Contact contact) {
    _contacts = _contacts.where((c) => c.id != contact.id).toList();

    // propagate result
    state.add(_contacts);
  }
}

class Contact {
  String id;
  String name;
  String lastName;

  Contact({this.id, this.name, this.lastName});

  static Contact newContact(String name) {
    final uuid = Uuid();
    return Contact(
      id: uuid.v4(),
    );
  }

  static Contact fromJson(Map<String, dynamic> json) {
    return Contact(
      id: json['id'],
      name: json['name'],
      lastName: json['lastName'],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'lastName': lastName,
    };
  }
}
