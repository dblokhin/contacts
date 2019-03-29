import 'package:rxdart/rxdart.dart';

final contactsModel = ContactsModel();

class ContactsModel {
  final state = BehaviorSubject<UserContactsState>();

  close() {
    state.close();
  }

  ContactsModel() {
    state.add(UserContactsLoadingState());
  }
}

class UserContactsState {
  final List<Contact> contacts = null;
}

class UserContactsLoadingState extends UserContactsState {}

class UserContactsResultState extends UserContactsState {
  final List<Contact> contacts;

  UserContactsResultState(this.contacts);
}

class Contact {}
