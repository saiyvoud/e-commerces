// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_final_fields

import 'package:flutter/material.dart';

class Bottombars extends StatefulWidget {
  const Bottombars({Key? key}) : super(key: key);

  @override
  State<Bottombars> createState() => _BottombarsState();
}

class _BottombarsState extends State<Bottombars> {
  int _currenwidget = 0;
  List<Widget> _children = [
    Container(
      height: 500,
      color: Colors.blue,
    ), // 1

    Container(
      height: 500,
      color: Colors.purple,
    ), //3
  ];
  void _onTap(int index) {
    setState(() {
      _currenwidget = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currenwidget],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.purple.shade500,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currenwidget,
        onTap: _onTap,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(Icons.notification_add), label: "notification"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
        ],
      ),
    );
  }
}
