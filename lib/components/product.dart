// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:e_commerces/components/data.dart';
import 'package:e_commerces/controller/product_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class ProductComponents extends StatefulWidget {
  const ProductComponents({super.key});

  @override
  State<ProductComponents> createState() => _ProductComponentsState();
}

class _ProductComponentsState extends State<ProductComponents> {
  // final ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        primary: false,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
        ),
        itemCount: product.length,
        itemBuilder: (context, index) {
          var data = product[index];
          return Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    '${data['image']}',
                    fit: BoxFit.cover,
                  ),
                  Text('${data['name']}'),
                  Text('${data['desc']}'),
                  Text('${data['amount']}'),
                  Text('${data['price']}'),
                ],
              ),
            ),
          );
        });
  }
}
