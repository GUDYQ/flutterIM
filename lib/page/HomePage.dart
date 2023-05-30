import 'package:flutter/material.dart';
import 'package:untitled2/page/ProfilePage.dart';

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
  final List<String> _labels = ['消息', '通讯录', '个人'];
  final List<BottomNavigationBarItem> _barItem = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.question_answer), label: '消息'),
    const BottomNavigationBarItem(icon: Icon(Icons.contacts), label: '通讯录'),
    const BottomNavigationBarItem(icon: Icon(Icons.perm_identity), label: '个人'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_labels[_currentIndex]),
        actions: [
          new IconButton(
            icon: new Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: null,
          )
        ],
      ),
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
