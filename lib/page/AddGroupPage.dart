// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';

class AddGroupPage extends StatelessWidget {
  const AddGroupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: TIMUIKitAddGroup(
      onTapExistGroup: (groupID, conversation) {},
    ));
  }
}
