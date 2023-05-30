import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'page/SearchPage.dart';
import 'page/AddGroupPage.dart';
import 'page/LoginPage.dart';
import 'page/HomePage.dart';
import 'page/ConversationPage.dart';
import 'page/AddFriendPage.dart';

class AppRouter {
  static const String initRoute = login;

  static const String login = "/login";
  static const String home = "/home";
  static const String conversation = "/conversation";
  static const String addFriend = "/addFriend";
  static const String addGroup = "/addGroup";
  static const String searchAll = "/searchAll";

  static List<GetPage> routes() {
    return [
      GetPage(name: login, page: () => const LoginPage(title: 'login',)),
      GetPage(name: home, page: () => const HomePage(title: 'home')),
      GetPage(name: conversation, page: () => const ConversationPage()),
      GetPage(name: addFriend, page: () => const AddFriendPage()),
      GetPage(name: addGroup, page: () => const AddGroupPage()),
      GetPage(name: searchAll, page: () => const SearchPage())
    ];
  }
  static Route<dynamic>? onUnknownRoute(RouteSettings routeSettings) {
    return MaterialPageRoute<void>(
      settings: routeSettings,
      builder: (BuildContext context) => const Scaffold(body: Center(child: Text('Not Found'))),
    );
  }
}
