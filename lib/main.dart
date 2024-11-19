import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pas1_mobile_11pplg1_04/screens/Bottom%20Nav/bottom_nav.dart';

import 'screens/Login/login_controller.dart';
import 'screens/Splash/splash_controller.dart';
import 'screens/Login/login_view.dart';
import 'screens/Splash/splash_screen.dart';
import 'screens/Profile/profile_controller.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: BindingsBuilder(() {
        Get.put(SplashController());
        Get.put(LoginController(), permanent: true);
        Get.put(ProfileController(), permanent: true);
      }),
      initialRoute: '/splash',
      getPages: [
        GetPage(
          name: '/splash',
          page: () => const SplashScreen(),
          binding: BindingsBuilder(() {
            Get.put(SplashController());
          }),
        ),
        GetPage(
          name: '/login',
          page: () => LoginView(),
          binding: BindingsBuilder(() {
            Get.put(LoginController());
          }),
        ),
        GetPage(
          name: '/home',
          page: () => const BottomNav(),
          binding: BindingsBuilder(() {
            Get.put(ProfileController());
          }),
        ),
      ],
    );
  }
}
