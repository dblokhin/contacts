// Copyright 2019 The Privacy App Developers. All rights reserved.
// Use of this source code is governed by a MIT LICENSE
// Also read license file that can be found in the LICENSE file.

import 'package:connectivity/connectivity.dart';
import 'package:rxdart/rxdart.dart';

final netModel = InternetModel();

class InternetModel {
  final state = BehaviorSubject<ConnectivityResult>();

  close() {
    state.close();
  }

  InternetModel() {
    Connectivity().checkConnectivity().then(state.add);
    Connectivity().onConnectivityChanged.listen(state.add);
  }
}
