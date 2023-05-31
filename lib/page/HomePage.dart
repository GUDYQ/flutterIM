import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/page/ProfilePage.dart';
import 'package:untitled2/router.dart';

import 'ContactPage.dart';
import 'ConversationPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _pageList = [
    const ConversationPage(),
    const ContactPage(),
    const ProfilePage()
  ];
  final List<AppBar> _appBarList = [
    AppBar(
      title: const Text('消息'),
    ),
    AppBar(title: const Text('通讯录'), actions: [
      PopupMenuButton<String>(
          offset: const Offset(0, 50),
          itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                PopupMenuItem<String>(
                  value: '1',
                  child: Row(
                    children: const [
                      Icon(
                        Icons.add_comment_outlined,
                        color: Colors.black,
                      ),
                      SizedBox(width: 10),
                      Text('创建群组'),
                    ],
                  ),
                ),
                PopupMenuItem<String>(
                  value: '2',
                  child: Row(
                    children: const [
                      Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      SizedBox(width: 10),
                      Text('搜索'),
                    ],
                  ),
                ),
                PopupMenuItem<String>(
                  value: '3',
                  child: Row(
                    children: const [
                      Icon(Icons.person_add, color: Colors.black),
                      SizedBox(width: 10),
                      Text('添加用户'),
                    ],
                  ),
                ),
                PopupMenuItem<String>(
                  value: '4',
                  child: Row(
                    children: const [
                      Icon(Icons.group_add, color: Colors.black),
                      SizedBox(width: 10),
                      Text('添加群组'),
                    ],
                  ),
                ),
              ],
          onSelected: (String value) {
            switch (value) {
              case '1':
                break;
              case '2':
                Get.toNamed(AppRouter.searchAll);
                break;
              case '3':
                Get.toNamed(AppRouter.addFriend);
                break;
              case '4':
                Get.toNamed(AppRouter.addGroup);
                break;
            }
          })
    ]),
    AppBar(
      title: const Text('账号信息'),
    )
  ];
  final List<BottomNavigationBarItem> _barItem = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.question_answer), label: '消息'),
    const BottomNavigationBarItem(icon: Icon(Icons.contacts), label: '通讯录'),
    const BottomNavigationBarItem(icon: Icon(Icons.perm_identity), label: '个人'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarList[_currentIndex],
      body: _pageList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        items: _barItem,
        iconSize: 25,
        fixedColor: Colors.green,
        selectedFontSize: 16,
        unselectedFontSize: 12,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
