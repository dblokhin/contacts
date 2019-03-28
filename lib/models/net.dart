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
