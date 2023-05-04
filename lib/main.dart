import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:test_project/screen/routers/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: ArchRoutes.login,
        getPages: AppPage.router);
  }
}
