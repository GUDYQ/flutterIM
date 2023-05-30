import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:untitled2/page/HomePage.dart';
import 'page/LoginPage.dart';

class AppRouter {
  static const String initRoute = login;

  static const String login = "/login";
  static const String home = "/home";
  static const String chat = "/chat";
  static const String addFriend = "/addFriend";
  static const String friendApply = "/friendApply";

  static List<GetPage> routes() {
    return [
      GetPage(name: login, page: () => const LoginPage(title: 'login',)),
      GetPage(name: home, page: () => const HomePage(title: 'home')),
      // GetPage(name: chat, page: () => const )
    ];
  }
  static Route<dynamic>? onUnknownRoute(RouteSettings routeSettings) {
    return MaterialPageRoute<void>(
      settings: routeSettings,
      builder: (BuildContext context) => const Scaffold(body: Center(child: Text('Not Found'))),
    );
  }
}
