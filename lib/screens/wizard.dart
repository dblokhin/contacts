// Copyright 2019 The Privacy App Developers. All rights reserved.
// Use of this source code is governed by a MIT LICENSE
// Also read license file that can be found in the LICENSE file.

import 'package:contacts/interfaces/localization.dart';
import 'package:contacts/models/mnemonic.dart';
import 'package:contacts/widgets/paragraph.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
                      _topSection(context),
                      SizedBox(height: 20),
                      _introSection(context),
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

  Widget _topSection(BuildContext context) {
    final lzn = AppLocalizations.of(context);

    return Text(
      lzn.welcome,
      style: Theme.of(context).textTheme.headline,
    );
  }

  Widget _introSection(BuildContext context) {
    final lzn = AppLocalizations.of(context);

    return Paragraph(lzn.wizardIntro);
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
          onPressed: () => print('open contact'),
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
              minHeight: MediaQuery.of(context).size.height - 80),
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _topSection(context),
                MnemonicCode(),
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
            lzn.newSeed,
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

  Widget _actionsSection(BuildContext context) {
    final lzn = AppLocalizations.of(context);

    return ButtonBar(
      alignment: MainAxisAlignment.end,
      children: <Widget>[
        RaisedButton(
          child: Text(lzn.recreate),
          onPressed: () => mnemonicModel.request(),
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

class MnemonicCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    mnemonicModel.request();

    return StreamBuilder<MnemonicGeneratorState>(
      stream: mnemonicModel.state,
      initialData: MnemonicGeneratorLoadingState(),
      builder: (ctx, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data;

          if (data is MnemonicGeneratorResultState) {
            return _mnemonic(ctx, data.mnemonic);
          }

          return Center(child: CircularProgressIndicator());
        }

        // never rich
        assert(false);
        return Text('unexcepted error #313');
      },
    );
  }

  Widget _mnemonic(BuildContext context, String seed) {
    final lzn = AppLocalizations.of(context);

    return Column(
      children: <Widget>[
        Divider(),
        Container(
          padding: const EdgeInsets.all(16),
          constraints: BoxConstraints(minWidth: double.infinity),
          child: Text(
            seed,
            style: Theme.of(context).textTheme.headline,
            textAlign: TextAlign.center,
          ),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.content_copy),
          title: Text(lzn.copySeed),
          onTap: () {
            Clipboard.setData(ClipboardData(text: seed));
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text(lzn.copiedSeed)));
          },
        ),
      ],
    );
  }
}
