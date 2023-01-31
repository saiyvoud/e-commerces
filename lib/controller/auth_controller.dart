import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final User? user = FirebaseAuth.instance.currentUser;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  // final productList = <ProductModel>[].obs;
  // final userModel = <UserModel>[].obs;
  var isLoading = false.obs;
  var userLoading = false.obs;
  @override
  void onInit() async {
    super.onInit();
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      /// A function that is used to sign in with email and password.
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        Get.snackbar("Login", "Login Successful",
            backgroundColor: Colors.green, colorText: Colors.white);

        Get.offAllNamed('/bottombar');
      });
    } catch (e) {
      Get.snackbar("Error Login", "${e.toString()}",
          colorText: Colors.white, backgroundColor: Colors.red);
    }
  }

  Future<void> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        firestore.collection("user").doc(value.user!.uid).set({
          "firstName": firstName,
          "lastName": lastName,
          "email": email,
          "password": password,
        }).then((value) async {
          Get.snackbar("Register", "Register Successful",
              colorText: Colors.white, backgroundColor: Colors.green);

          Get.offAllNamed('/bottombar');
        });
      });
    } catch (e) {
      Get.snackbar("Error Register", "${e.toString()}",
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  Future<void> logout() async {
    await auth.signOut();
    Get.offAllNamed("/login");
  }

  void validateAuth() {
    if (auth.currentUser == null) {
      Get.offAllNamed("/login");
    } else {
      Get.offAllNamed("/bottombar");
    }
  }
}
