// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';
import 'package:tencent_cloud_chat_uikit/ui/views/TIMUIKitProfile/profile_widget.dart';
import 'package:get/get.dart';
import 'ChatPage.dart';

class FriendProfile extends StatelessWidget {
  final String? userID;
  final bool? enableTopTitle;
  const FriendProfile({Key? key, this.userID, this.enableTopTitle}) : super(key: key);

  _buildBottomOperationList(
      BuildContext context, V2TimConversation conversation) {
    final operationList = [
      {
        "label": ("发送消息"),
        "id": "sendMsg",
      }
    ];

    return operationList.map((e) {
      return InkWell(
        onTap: () {
          if (e["id"] == "sendMsg") {
            Get.to(() => ChatPage(
                    selectedConversation: conversation,
                  ),
                );
          }
        },
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 15),
          decoration: const BoxDecoration(
              color: Colors.white,
              border:
              Border(bottom: BorderSide(color: Colors.grey))),
          child: Text(
            e["label"] ?? "",
            style: TextStyle(
                color: e["id"] != "deleteFriend"
                    ? Colors.blue
                    : Colors.red,
                fontSize: 17),
          ),
        ),
      );
    }).toList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.white,
        title: const Text(
          ("详细资料"),
          style: TextStyle(color: Colors.white, fontSize: 17),
        ),
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
        ),
        leading: IconButton(
          padding: const EdgeInsets.only(left: 16),
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        child: TIMUIKitProfile(
          userID: userID?? "admin",
          profileWidgetBuilder: ProfileWidgetBuilder(
              customBuilderOne: (bool isFriend, V2TimFriendInfo friendInfo,
                  V2TimConversation conversation) {
                if (!isFriend) {
                  return Container();
                }
                return Column(
                    children: _buildBottomOperationList(
                        context, conversation));
              }),
          profileWidgetsOrder: const [
            ProfileWidgetEnum.userInfoCard,//用户信息卡片
            ProfileWidgetEnum.nicknameBar,//用户昵称栏
            // ProfileWidgetEnum.userAccountBar,//用户账号栏
            // ProfileWidgetEnum.signatureBar,//用户签名栏
            ProfileWidgetEnum.operationDivider,//分割线
            ProfileWidgetEnum.remarkBar,//用户备注
            ProfileWidgetEnum.genderBar,//用户性别
            ProfileWidgetEnum.birthdayBar,//用户生日
            ProfileWidgetEnum.operationDivider,//分割线
            ProfileWidgetEnum.addToBlockListBar,//添加黑名单功能
            ProfileWidgetEnum.pinConversationBar,//会话置顶功能
            ProfileWidgetEnum.messageMute,//禁言用户功能
            ProfileWidgetEnum.operationDivider,//分割线
            ProfileWidgetEnum.addAndDeleteArea//添加或删除功能
          ],
        ),
      ),
    );
  }
}
