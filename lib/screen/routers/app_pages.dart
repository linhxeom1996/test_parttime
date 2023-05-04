import 'package:get/route_manager.dart';
import 'package:test_project/screen/login/bindings/login_bindings.dart';
import 'package:test_project/screen/login/views/password.dart';

import '../login/views/username.dart';

class ArchRoutes {
  static const login = "/login";
  static const password = "/password";
}

class AppPage {
  static final router = [
    GetPage(
        name: ArchRoutes.login,
        page: () => const UserNamePage(),
        binding: LoginBinding()),
    GetPage(
        name: ArchRoutes.password,
        page: () => PasswordPage(),
        binding: LoginBinding(),
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 200))
  ];
}
