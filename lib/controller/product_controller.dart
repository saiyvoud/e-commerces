import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/product_model.dart';

class ProductController extends GetxController {
  final firestore = FirebaseFirestore.instance;
  final productlist = <ProductModel>[].obs;
  var loading = false.obs;
  @override
  void onInit() async {
    await fecthProduct();
    super.onInit();
  }

  Future fecthProduct() async {
    loading(true);
    try {
      final QuerySnapshot querySnapshot =
          await firestore.collection('products').get();
      productlist.clear();
      for (int i = 0; i < querySnapshot.docs.length; i++) {
        var data = querySnapshot.docs;
        print('========>${data[i].id}');
        productlist.add(ProductModel(
          id: data[i]['id'],
          name: data[i]['name'],
          desc: data[i]['desc'],
          amount: data[i]['amount'],
          price: data[i]['price'],
          image: data[i]['image'],
        ));
      }
      loading(false);
      update();
    } catch (e) {
      Get.snackbar(
        "Error get Product",
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      loading(false);
      update();
    }
  }
}
