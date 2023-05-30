import 'package:flutter/material.dart';

import 'ContactPage.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key, required this.title});

  final String title;

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int _currentIndex = 0;
  List<Widget> _pageList = [
    ContactPage()
  ];
  final List<BottomNavigationBarItem> _barItem = [
    BottomNavigationBarItem(icon: Icon(Icons.question_answer), label: '消息'),
    BottomNavigationBarItem(icon: Icon(Icons.account_balance), label: '通讯录'),
    BottomNavigationBarItem(icon: Icon(Icons.perm_identity), label: '个人'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          new IconButton(
            icon: new Icon(Icons.add, color: Colors.white,),
            onPressed: null,
          )],
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
