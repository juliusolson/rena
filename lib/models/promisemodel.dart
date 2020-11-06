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
        'Här srkiver du dina anledningar till att vilja minska ditt spelande');
    addPromise('Så du enkelt kan gå tillbaka och kolla på');
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
