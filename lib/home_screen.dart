import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'app/Screens/bottom_add_card.dart';
import 'app/Screens/bottom_fav.dart';
import 'app/Screens/bottom_home.dart';
import 'app/Screens/bottom_register.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int currentindex = 0;
  final screen = [
    const Home_Page(),
    const Add_Card(),
    const Favorite(),
    const Account(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[currentindex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        index: currentindex,
        height: 60,
        onTap: (index) => setState(() => currentindex = index),
        color: Colors.indigo,
        items: const <Widget>[
          Icon(
            Icons.home,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.shopping_cart_outlined,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.play_arrow,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.app_registration_outlined,
            size: 30,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
