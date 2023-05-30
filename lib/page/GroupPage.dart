// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';
import 'package:untitled2/Example/TIMUIKitChatExample.dart';

class GroupPage extends StatelessWidget {
  const GroupPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            ("群聊"),
            style: const TextStyle(color: Colors.white, fontSize: 17),
          ),
          shadowColor: Colors.white,
          flexibleSpace: Container(
            decoration: BoxDecoration(
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
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TIMUIKitChatExample(
                  selectedConversation: conversation,
                ),
              ));
        },
        emptyBuilder: (_) {
          return Center(
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
