// Copyright 2019 The Privacy App Developers. All rights reserved.
// Use of this source code is governed by a MIT LICENSE
// Also read license file that can be found in the LICENSE file.

import 'package:contacts/interfaces/localization.dart';
import 'package:contacts/models/app.dart';
import 'package:contacts/ui/general.dart';
import 'package:contacts/ui/paragraph.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SeedRequired extends StatefulWidget {
  final Widget child;

  const SeedRequired({Key key, @required this.child})
      : assert(child != null),
        super(key: key);

  @override
  _SeedRequiredState createState() => _SeedRequiredState();
}

class _SeedRequiredState extends State<SeedRequired> {
  @override
  Widget build(BuildContext context) {
    final isSeedExists = (appModel.seed == null || appModel.seed.length == 0);

    return (isSeedExists)
        ? SeedWizardScreen(onSeedApplied: () => setState(() {}))
        : widget.child;
  }
}

class SeedWizardScreen extends StatefulWidget {
  final void Function() onSeedApplied;

  const SeedWizardScreen({Key key, this.onSeedApplied}) : super(key: key);

  @override
  _SeedWizardScreenState createState() => _SeedWizardScreenState();
}

class _SeedWizardScreenState extends State<SeedWizardScreen> {
  int wizardStep = 0;

  @override
  Widget build(BuildContext context) {
    switch (wizardStep) {
      case 0:
        return _WizardStep1(
          next: () => setState(() {
            wizardStep++;
          }),
        );
      case 1:
        return _WizardStep2(
          back: () => setState(() {
            wizardStep--;
          }),
          next: () => setState(() {
            wizardStep++;
          }),
        );
    }

    assert(false);
    return Container();
  }
}

// It's just a Welcome screen with app description
class _WizardStep1 extends StatelessWidget {
  final void Function() next;

  const _WizardStep1({Key key, @required this.next}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lzn = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Privace Contacts Wizard'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 16),
                CenterText(
                  lzn.welcome,
                  style: Theme.of(context).textTheme.headline,
                ),
                SizedBox(height: 16),
                Paragraph(lzn.wizardIntro),
              ],
            ),
          ),
        ),
      ),
      persistentFooterButtons: <Widget>[
        RaisedButton(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child: Text(lzn.next),
          ),
          onPressed: next,
        )
      ],
    );
  }
}

/// Ask user a question screen: Have you a seed-phrase?
class _WizardStep2 extends StatelessWidget {
  final void Function() back;
  final void Function() next;

  const _WizardStep2({Key key, @required this.back, @required this.next})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*

                CenterText(
                  lzn.haveYouSeed,
                  style: Theme.of(context).textTheme.headline,
                ),

    RaisedButton(
      child: Text(lzn.alreadyHaveSeed),
      onPressed: back,
    ),
    RaisedButton(
    color: Colors.amber[800],
    child: Text(lzn.createNewSeed),
    onPressed: next,
    )*/
    return Container();
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
          onPressed: () => null,
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
    return Center(child: CircularProgressIndicator());

    //mnemonicModel.request();
    return StreamBuilder(
      stream: null,
      builder: (ctx, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data;

          /*if (data is MnemonicGeneratorResultState) {
            return _mnemonic(ctx, data.mnemonic);
          }*/

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
