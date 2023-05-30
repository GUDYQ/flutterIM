// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';

class TIMUIKitContactExample extends StatelessWidget {
  const TIMUIKitContactExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<TopListItem> topListItem = [
      TopListItem(
        avatarUrl: 'https://imgcache.qq.com/qcloud/public/static//avatar1_100.20191230.png',
        title: '小明',
        subTitle: '我是小明',
        userID: 'userID',
      ),
      TopListItem(
        avatarUrl: 'https://imgcache.qq.com/qcloud/public/static//avatar1_100.20191230.png',
        title: '小红',
        subTitle: '我是小红',
        userID: 'userID',
      ),
    ];
    return const TIMUIKitContact();
  }
}
