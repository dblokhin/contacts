import 'package:contacts/interfaces/localization.dart';
import 'package:contacts/models/screen.dart';
import 'package:flutter/material.dart';

class WizardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final lzn = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(lzn.seedWizard)),
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height - 80),
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 20),
                      _topTitle(context),
                      SizedBox(height: 20),
                      _intro(context),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        lzn.haveYouSeed,
                        style: Theme.of(context).textTheme.subhead,
                      ),
                    ),
                    SizedBox(height: 20),
                    _actions(context),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _topTitle(BuildContext context) {
    final lzn = AppLocalizations.of(context);

    return Text(
      lzn.welcome,
      style: Theme.of(context).textTheme.headline,
    );
  }

  Widget _intro(BuildContext context) {
    final lzn = AppLocalizations.of(context);

    return Text(
      lzn.seedIntro,
      textAlign: TextAlign.justify,
    );
  }

  Widget _actions(BuildContext context) {
    final lzn = AppLocalizations.of(context);

    return ButtonBar(
      alignment: MainAxisAlignment.end,
      children: <Widget>[
        RaisedButton(
          child: Text(lzn.alreadyHaveSeed),
          onPressed: () => print('have'),
        ),
        RaisedButton(
          color: Colors.amber[800],
          child: Text(lzn.createNewSeed),
          onPressed: () => appScreen.openSeedGenerationScreen(context),
        )
      ],
    );
  }
}

class WizardCreateSeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final lzn = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(lzn.seedWizard)),
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height - 80),
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _topSection(context),
                _seedSection(context),
                _actionsSection(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _topSection(BuildContext context) {
    final lzn = AppLocalizations.of(context);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20),
          Text(
            lzn.yourSeed,
            style: Theme.of(context).textTheme.headline,
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 20),
          Text(
            lzn.seedIntro,
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }

  Widget _seedSection(BuildContext context) {
    final lzn = AppLocalizations.of(context);

    return Column(
      children: <Widget>[
        Divider(),
        Container(
          padding: const EdgeInsets.all(16),
          constraints: BoxConstraints(minWidth: double.infinity),
          child: Text(
            "some seed content very alot things happy nation butty some needs gotten applicant",
            style: Theme.of(context).textTheme.headline,
            textAlign: TextAlign.center,
          ),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.content_copy),
          title: Text(lzn.copySeed),
          onTap: () {
            print('copied');
          },
        ),
      ],
    );
  }

  Widget _actionsSection(BuildContext context) {
    final lzn = AppLocalizations.of(context);

    return ButtonBar(
      alignment: MainAxisAlignment.end,
      children: <Widget>[
        RaisedButton(
          child: Text(lzn.recreate),
          onPressed: () => print('new click'),
        ),
        RaisedButton(
          color: Colors.amber[800],
          child: Text(lzn.next),
          onPressed: () => print('accept'),
        )
      ],
    );
  }
}
