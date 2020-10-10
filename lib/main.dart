import 'package:flutter/material.dart';
import 'package:rena/utils/destination.dart';
import 'package:rena/screens/views.dart';
import 'package:rena/theme/style.dart';

void main() {
  runApp(RenaApp());
}

class RenaApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Rena",
      home: Nav(),
      theme: appTheme(),
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
      appBar: AppBar(
        title: Text("Rena", 
          style: TextStyle(fontFamily: "Renogare"),
        ),
        actions: [
          Icon(Icons.settings),
        ],

      ),
      body: SafeArea(
        top: false,
        child: IndexedStack(
          index: _currentIndex,
          children: _children,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: (int idx) => setState(() => _currentIndex = idx),
        items: allDestinations.map((Destination dest) {
            return BottomNavigationBarItem(
              icon: Icon(dest.icon),
              label: dest.title,
            );
          }).toList(),
      ),
    );
  }
}
