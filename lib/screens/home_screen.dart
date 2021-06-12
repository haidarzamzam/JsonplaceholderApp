import 'package:case_devido/screens/menus/category/category_screen.dart';
import 'package:case_devido/screens/menus/post/post_screen.dart';
import 'package:case_devido/utils/constant.dart';
import 'package:case_devido/utils/util.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    PostScreen(),
    CategoryScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.filter_none),
            label: 'Post',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: HexColor(ColorPalette['ColorPrimaryDark']),
        backgroundColor: Colors.white,
        unselectedItemColor: HexColor(ColorPalette['ColorPrimary']),
        onTap: _onItemTapped,
      ),
    );
  }
}
