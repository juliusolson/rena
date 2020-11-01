class Promise {
  String body;
  Promise(this.body);
}

class Promises {
  List<Promise> promises;
  Promises() {
    promises = [
      Promise(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua'),
      Promise('bla bla bla bla')
    ];
  }
}
