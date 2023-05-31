// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';
import 'package:tencent_cloud_chat_uikit/ui/views/TIMUIKitGroupProfile/group_profile_widget.dart';

class GroupChatPage extends StatelessWidget {
  final V2TimConversation? selectedConversation;

  const GroupChatPage({Key? key, this.selectedConversation})
      : super(key: key);

  Widget renderCustomStickerPanel({
    sendTextMessage,
    sendFaceMessage,
    deleteText,
    addCustomEmojiText,
    addText,
    List<CustomEmojiFaceData> defaultCustomEmojiStickerList = const [],
    double? height,
    double? width
  }) {
    final defaultEmojiList =
    defaultCustomEmojiStickerList.map((customEmojiPackage) {
      return CustomStickerPackage(
          name: customEmojiPackage.name,
          baseUrl: "assets/custom_face_resource/${customEmojiPackage.name}",
          isEmoji: customEmojiPackage.isEmoji,
          isDefaultEmoji: true,
          stickerList: customEmojiPackage.list
              .asMap()
              .keys
              .map((idx) =>
              CustomSticker(index: idx, name: customEmojiPackage.list[idx]))
              .toList(),
          menuItem: CustomSticker(
            index: 0,
            name: customEmojiPackage.icon,
          ));
    }).toList();
    return StickerPanel(
        sendTextMsg: sendTextMessage,
        sendFaceMsg: (index, data) =>
            sendFaceMessage(index + 1, (data.split("/")[3]).split("@")[0]),
        deleteText: deleteText,
        addText: addText,
        addCustomEmojiText: addCustomEmojiText,
        customStickerPackageList: [
          ...defaultEmojiList,
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return TIMUIKitChat(
      conversation: V2TimConversation(
        conversationID: selectedConversation?.groupID ?? "group_10040818",
        groupID: selectedConversation?.groupID ?? "group_10040818",
        type: 2,
      ),
      conversationShowName: selectedConversation?.showName ?? "group_10040818",
      appBarConfig: AppBar(
        actions: [
          IconButton(
              padding: const EdgeInsets.only(left: 8, right: 16),
              onPressed: () async {
                  final String? groupID = selectedConversation?.groupID;
                  if (groupID != null) {
                    Get.to(() => Scaffold(
                              appBar: AppBar(title: Text(groupID)),
                              body: TIMUIKitGroupProfile(
                                groupID: groupID,
                                  profileWidgetsOrder: const [
                                    GroupProfileWidgetEnum.detailCard, //群组详细信息
                                    GroupProfileWidgetEnum.operationDivider, //分割线
                                    GroupProfileWidgetEnum.memberListTile, //群组成员列表
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
                                  ],
                              )),
                        );
                  }
              },
              icon: Image.asset(
                'images/more.png',
                package: 'tencent_cloud_chat_uikit',
                height: 34,
                width: 34,
              ))
        ],
      ),
    );
  }
}
