// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';
import 'package:tencent_cloud_chat_uikit/ui/views/TIMUIKitGroupProfile/group_profile_widget.dart';

class GroupProfilePage extends StatelessWidget {
  final String? groupID;

  const GroupProfilePage({Key? key, this.groupID})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TIMUIKitGroupProfile(
      groupID: groupID ??
          '@TGS#1X2AML5H6', // Please fill in here according to the actual cleaning
        profileWidgetsOrder: const [
          GroupProfileWidgetEnum.detailCard, //群组详细信息
          GroupProfileWidgetEnum.operationDivider, //分割线
          GroupProfileWidgetEnum.memberListTile, //群组成员列表
          GroupProfileWidgetEnum.operationDivider, //分割线
          GroupProfileWidgetEnum.operationDivider, //分割线
          GroupProfileWidgetEnum.groupNotice, //群公告
          GroupProfileWidgetEnum.groupManage, //群管理
          GroupProfileWidgetEnum.groupJoiningModeBar, //加群方式设置
          GroupProfileWidgetEnum.groupTypeBar, //群类型栏
          GroupProfileWidgetEnum.operationDivider, //分割线
          GroupProfileWidgetEnum.pinedConversationBar, //置顶聊天功能
          GroupProfileWidgetEnum.muteGroupMessageBar, //消息免打扰
          GroupProfileWidgetEnum.operationDivider, //分割线
          GroupProfileWidgetEnum.nameCardBar, //我的群昵称
          GroupProfileWidgetEnum.operationDivider, //分割线
          GroupProfileWidgetEnum.buttonArea, //按钮功能区
        ]
    );
  }
}
