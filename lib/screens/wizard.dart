import 'package:contacts/interfaces/localization.dart';
import 'package:flutter/material.dart';

class WizardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final lzn = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(title: Text('Privacy Contacts')),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints.tightForFinite(),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 20),
                      _topTitle(context),
                      SizedBox(height: 20),
                      _intro(context),
                      SizedBox(height: 20),
                    ],
                  ),
                  Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Divider(),
                      SizedBox(height: 20),
                      Text(
                        lzn.haveYouSeed,
                        style: Theme.of(context).textTheme.subhead,
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
      alignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        RaisedButton(
          child: Text(lzn.alreadyHaveSeed),
          onPressed: () => print('have'),
        ),
        RaisedButton(
          child: Text(lzn.createNewSeed),
          onPressed: () => print('new seed'),
        )
      ],
    );
  }
}
