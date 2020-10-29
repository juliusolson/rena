import 'package:flutter/material.dart';

class Destination {
  const Destination(this.title, this.icon, this.color);

  final String title;
  final IconData icon;
  final MaterialColor color;
}

const List<Destination> allDestinations = <Destination>[
  Destination("Översikt", Icons.blur_circular_rounded, Colors.teal),
  Destination("Sparmål", Icons.money, Colors.red),
  Destination("Socialt", Icons.person, Colors.red),
  Destination("Stöd", Icons.support, Colors.green),
];