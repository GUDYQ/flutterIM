// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';

import 'GroupChatPage.dart';

class GroupPage extends StatelessWidget {
  const GroupPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            ("群聊"),
            style: TextStyle(color: Colors.white, fontSize: 17),
          ),
          shadowColor: Colors.white,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                CommonColor.lightPrimaryColor,
                CommonColor.primaryColor
              ]),
            ),
          ),
          iconTheme: const IconThemeData(
            color: Colors.white,
          )),
      body: TIMUIKitGroup(
        onTapItem: (groupInfo, conversation) {
          final groupID = groupInfo.groupID;
          print(groupInfo);
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GroupChatPage(
                  selectedConversation: conversation,
                ),
              ));
        },
        emptyBuilder: (_) {
          return const Center(
            child: Text(("暂无群聊")),
          );
        },
        groupCollector: (groupInfo) {
          final groupID = groupInfo?.groupID ?? "";
          return !groupID.contains("im_discuss_");
        },
      ),
    );
  }
}
