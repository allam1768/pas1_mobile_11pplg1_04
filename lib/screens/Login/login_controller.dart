import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'login_service.dart';

class LoginController extends GetxController {
  final storage = GetStorage();
  final LoginService apiServicee = LoginService();
  var isLoading = false.obs;
  var loginStatus = ''.obs;

  Future<void> loginUser(String username, String password) async {

    isLoading(true);

    final responseData = await apiServicee.login(username, password);

    if (responseData['status'] == true) {
      loginStatus.value = 'Login berhasil: ${responseData['message']}';

      await storage.write('isLoggedIn', true);

      Get.snackbar(
        'Sukses',
        'Login berhasil!',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      Get.offAllNamed('/home');

    } else {
      loginStatus.value = 'Login gagal: ${responseData['message']}';
      Get.snackbar(
        'Error',
        responseData['message'] ?? 'Login gagal.',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}

