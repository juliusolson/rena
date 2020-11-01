import 'package:flutter/material.dart';
import 'package:rena/utils/destination.dart';
import 'package:rena/screens/views.dart';
import 'package:rena/theme/style.dart';

void main() {
  runApp(RenaApp());
}

class RenaApp extends StatefulWidget {
  RenaApp({Key key}) : super(key: key);

  @override
  _RenaAppState createState() => _RenaAppState();
}

class _RenaAppState extends State<RenaApp> {
  // This widget is the root of your application.
  bool _light = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Rena",
      home: Nav(switcher: () {
        setState(() {
          _light = !_light;
        });
      }),
      theme: _light ? lightTheme() : darkTheme(),
    );
  }
}

class Nav extends StatefulWidget {
  final String title;
  final Function switcher;
  Nav({Key key, this.title, this.switcher}) : super(key: key);

  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _currentIndex = 0;
  final List<Widget> _children = allViews;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Rena",
          style: TextStyle(fontFamily: "Renogare"),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.lightbulb),
            onPressed: () => this.widget.switcher(),
          ),
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
        selectedItemColor: Theme.of(context).textTheme.bodyText1.color,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: Theme.of(context).textTheme.caption,
        unselectedLabelStyle: Theme.of(context).textTheme.caption,
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
