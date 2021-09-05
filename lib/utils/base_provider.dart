

import 'package:flutter/cupertino.dart';

enum AppState {Loading, Loaded, Failed}

class BaseProvider extends ChangeNotifier {
  bool loading = true;
  bool errorOccurred = false;
  String message = '';


  void backToLoading({String msg = ''}) {
    loading = true;
    errorOccurred = false;
    message = msg;
    notifyListeners();
  }

  void backToFailed({String msg = ''}) {
    loading = false;
    errorOccurred = true;
    message = msg;
    notifyListeners();
  }

  void backToLoaded() {
    loading = false;
    errorOccurred = false;
    notifyListeners();
  }
}

