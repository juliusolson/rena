import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'dart:collection';
import 'dart:math';

class WeeklySpending {
  final String week;
  final num spendings;
  WeeklySpending(this.week, this.spendings);
}

/// Sample linear data type.
class SpendingCategory {
  final int amount;
  final int n;
  final String name;
  final String color;

  SpendingCategory(this.amount, this.n, this.name, this.color);
  String toString() {
    return '${this.name}: ${this.amount.toString()} kr';
  }
}

class WeeklySpendingModel extends ChangeNotifier {
  int week = 0;
  int spending = 0;
  DummyData data;
  List<SpendingCategory> currentCategories;
  WeeklySpendingModel() {
    data = DummyData(5);
    currentCategories = data.week2spending[44];
    this.week = 44;
    this.spending = data.week2spending[this.week][0].amount;
    notifyListeners();
  }
  void changeWeek(int weekIndex) {
    this.week = data.week2spending.keys.toList()[weekIndex];
    this.currentCategories = data.week2spending[this.week];
    this.spending = this.currentCategories[0].amount;
    debugPrint('Changed week to:' + week.toString());
    notifyListeners();
  }

  List<String> getWeekNames() {
    return data.week2spending.keys.map((i) => 'Vecka ${i.toString()}').toList();
  }
}

class DummyData {
  static List<String> categories = [
    'Spel',
    'Boende',
    'Mat',
    'Nöje',
    'Transport',
    'Övrigt'
  ];
  static List<String> colors = [
    '#ED1E79',
    '#FBAE17',
    '#F15A24',
    '#7EC5FF',
    '#8333FF',
    '#00f365'
  ];
  LinkedHashMap week2spending =
      new LinkedHashMap<int, List<SpendingCategory>>();
  DummyData(int numberOfWeeks) {
    Random rng = new Random();
    SpendingCategory sc;
    int startWeek = 40;
    for (var j = 0; j < numberOfWeeks; j++) {
      List<SpendingCategory> spendingCategories = new List();
      for (var i = 0; i < categories.length; i++) {
        sc = new SpendingCategory(
            10 + rng.nextInt(200), i, categories[i], colors[i]);
        spendingCategories.add(sc);
      }
      week2spending[startWeek + j] = spendingCategories;
    }
  }
}
