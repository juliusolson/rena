import 'package:flutter/material.dart';
import 'package:rena/utils/destination.dart';
import 'package:rena/screens/views.dart';

void main() {
  runApp(RenaApp());
}

class RenaApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rena',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Nav()
    );
  }
}

class Nav extends StatefulWidget {
  Nav({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {

  int _currentIndex = 0;
  final List <Widget> _children = allViews;

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: Text("asdasd"),
        backgroundColor: Colors.grey,
      ),
      body: SafeArea(
        top: false,
        child: IndexedStack(
          index: _currentIndex,
          children: _children,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red,
        currentIndex: _currentIndex,
        onTap: (int idx) => setState(() => _currentIndex = idx),
        items: allDestinations.map((Destination dest) {
            return BottomNavigationBarItem(
              icon: Icon(dest.icon),
              backgroundColor: Colors.red,
              label: dest.title,
            );
          }).toList(),
      ),
    );
  }
}
