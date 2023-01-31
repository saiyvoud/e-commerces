// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:e_commerces/components/banner.dart';
import 'package:e_commerces/components/menu.dart';
import 'package:e_commerces/components/product.dart';
import 'package:e_commerces/controller/auth_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../controller/product_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthController controller = Get.put(AuthController());
  final ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (productController.loading.value) {
        return CircularProgressIndicator();
      } else {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.indigo.shade800,
            title: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    hintText: 'search product ..'),
              ),
            ),
            actions: [
              Stack(
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
                  Positioned(
                    top: 1,
                    right: 1,
                    child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.red,
                        ),
                        child: Center(child: Text('0'))),
                  ),
                ],
              ),
              IconButton(
                  onPressed: () {
                    controller.logout();
                  },
                  icon: Icon(Icons.exit_to_app)),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10),
                BannerComponents(),
                SizedBox(height: 10),
                MenuComponents(),
                SizedBox(height: 10),
                Center(
                  child: Text(
                    'Product Recommand',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                ProductComponents(),
              ],
            ),
          ),
        );
      }
    });
  }
}
