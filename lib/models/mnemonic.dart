// Copyright 2019 The Privacy App Developers. All rights reserved.
// Use of this source code is governed by a MIT LICENSE
// Also read license file that can be found in the LICENSE file.

import 'package:contacts/interfaces/mnemonic.dart';
import 'package:rxdart/rxdart.dart';

final mnemonicModel = MnemonicGenerator();

class MnemonicGenerator {
  final state = PublishSubject<MnemonicGeneratorState>();

  close() {
    state.close();
  }

  request() {
    state.add(MnemonicGeneratorLoadingState());
    state.add(MnemonicGeneratorResultState(Mnemonic().mnemonic));
  }
}

class MnemonicGeneratorState {}

class MnemonicGeneratorLoadingState extends MnemonicGeneratorState {}

class MnemonicGeneratorResultState extends MnemonicGeneratorState {
  final String mnemonic;

  MnemonicGeneratorResultState(this.mnemonic);
}
