import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'page/LoginPage.dart';
import 'page/HomePage.dart';
import 'page/ConversationPage.dart';

class AppRouter {
  static const String initRoute = login;

  static const String login = "/login";
  static const String home = "/home";
  static const String conversation = "/conversation";
  static const String addFriend = "/addFriend";
  static const String friendApply = "/friendApply";

  static List<GetPage> routes() {
    return [
      GetPage(name: login, page: () => const LoginPage(title: 'login',)),
      GetPage(name: home, page: () => const HomePage(title: 'home')),
      GetPage(name: conversation, page: () => const ConversationPage())
    ];
  }
  static Route<dynamic>? onUnknownRoute(RouteSettings routeSettings) {
    return MaterialPageRoute<void>(
      settings: routeSettings,
      builder: (BuildContext context) => const Scaffold(body: Center(child: Text('Not Found'))),
    );
  }
}
