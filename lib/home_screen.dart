import 'package:book_reader_app/dashboard_screen.dart';
import 'package:book_reader_app/discover/discovery_sreen.dart';
import 'package:book_reader_app/profile/profile_screen.dart';
import 'package:flutter/material.dart';

/// description:
/// project: book_reader_app
/// @package: 
/// @author: dammyololade
/// created on: 01/09/2020

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  List<Widget> _widgets = [
    DashboardScreen(),
    DiscoveryScreen(),
    ProfileScreen()
  ];

  var selectedItem = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          _itemBuilder("for you", Icons.radio_button_checked),
          _itemBuilder("discover", Icons.collections_bookmark),
          _itemBuilder("profile", Icons.person),
        ],
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: TextStyle(
            fontFamily: "ABook",
            fontSize: 12
        ),
        selectedLabelStyle: TextStyle(
            fontFamily: "AMedium",
            fontSize: 12
        ),
        currentIndex: selectedItem,
        onTap: (val) {
          setState(() {
            selectedItem = val;
          });
        },
      ),
      body: IndexedStack(
        index: selectedItem,
        children: _widgets,
      ),
    );
  }
  
  BottomNavigationBarItem _itemBuilder(String title, IconData iconData) {
    return BottomNavigationBarItem(
        icon: Icon(iconData),
      title: Padding(
        padding: const EdgeInsets.only(top: 3),
        child: Text(title,
        ),
      )
    );
  }
}
