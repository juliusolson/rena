import 'package:flutter/material.dart';
import 'package:rena/theme/icons.dart';

class Destination {
  const Destination(this.title, this.icon, this.color);

  final String title;
  final IconData icon;
  final MaterialColor color;
}

const List<Destination> allDestinations = <Destination>[
  Destination("Översikt", CustomIcons.omni, Colors.teal),
  Destination("Sparmål", CustomIcons.savings, Colors.red),
  Destination("Socialt", CustomIcons.pins, Colors.red),
  Destination("Stöd", CustomIcons.lifebuoy_1, Colors.green),
];