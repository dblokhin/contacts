import 'package:contacts/models/contacts.dart';
import 'package:contacts/models/screen.dart';
import 'package:flutter/material.dart';

class BookScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          _topBar(context),
          SizedBox(height: 8),
          Expanded(child: _contactList(context)),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: null),
    );
  }

  Widget _topBar(BuildContext context) {
    final String searchFieldLabel =
        MaterialLocalizations.of(context).searchFieldLabel;
    final String showMenuTooltip =
        MaterialLocalizations.of(context).showMenuTooltip;
    final String collapsedIconTapHint =
        MaterialLocalizations.of(context).collapsedIconTapHint;

    return Card(
      child: ListTile(
        dense: true,
        leading: IconButton(
            tooltip: showMenuTooltip,
            icon: Icon(Icons.menu),
            onPressed: () => print('hello')),
        title: Text(searchFieldLabel),
        trailing: IconButton(
          tooltip: collapsedIconTapHint,
          icon: Icon(Icons.more_vert),
          onPressed: null,
        ),
      ),
    );
  }

  Widget _contactList(BuildContext context) {
    return StreamBuilder(
      stream: bookScreen.state,
      initialData: BookInitState(),
      builder: (ctx, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data;

          if (data is BookInitState) {
            return Center(child: CircularProgressIndicator());
          }

          if (data is BookListState) {
            final contacts = data.contacts;

            if (contacts.length == 0) return _emptyList();

            return ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (ctx, index) =>
                    _contactItem(ctx, contacts[index]));
          }

          if (data is BookErrorState) {
            print('book: print error ${data.error}');
            Center(child: Text(data.error.toString()));
          }
        }

        return Center(child: Text('unexpected error'));
      },
    );
  }

  Widget _emptyList() {
    return Center(child: Text('empty_list'));
  }

  Widget _contactItem(BuildContext context, Contact contact) {
    return ListTile(
      title: Text(contact.name),
    );
  }
}
