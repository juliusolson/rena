import 'package:flutter/widgets.dart';

class Promise {
  int id;
  String body;
  Promise(this.body, this.id);
}

class Promises extends ChangeNotifier {
  int idCounter = 0;
  List<Promise> promises;
  Promises() {
    promises = [];
    addPromise(
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua');
    addPromise('bla bla bla bla');
  }

  void addPromise(String promsiseBody) {
    debugPrint('Saving Promise');
    promises.add(Promise(promsiseBody, idCounter));
    idCounter++;
    notifyListeners();
  }

  void deletePromise(Promise promise) {
    debugPrint('Deleting Promise');
    promises.remove(promise);
    notifyListeners();
  }

  void editPromise(Promise promise, String newPromiseBody) {
    promise.body = newPromiseBody;
    notifyListeners();
  }
}
