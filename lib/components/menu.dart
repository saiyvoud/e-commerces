// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:e_commerces/components/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MenuComponents extends StatelessWidget {
  const MenuComponents({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: GridView.builder(
        shrinkWrap: true,
        primary: false,
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: menu.length,
        itemBuilder: (context, index) => Column(
          children: [
            Image.asset(
              "${menu[index]['icon']}",
            ),
            SizedBox(height: 5),
            Text('${menu[index]['name']}'),
          ],
        ),
      ),
    );
  }
}
