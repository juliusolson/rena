import 'package:flutter/material.dart';
import 'package:rena/screens/home/homeview.dart';
import 'package:rena/screens/panik/panikview.dart';
import 'package:rena/screens/profile/socialView.dart';
import 'package:rena/screens/budget/budgetview.dart';

List<Widget> allViews = <Widget>[
  HomeView(),
  BudgetView("Budget"),
  SocialView("Profile"),
  PanikView("Panik"),
];
