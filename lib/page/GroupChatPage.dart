// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';

import '../Example/TIMUIKitGroupProfileExample.dart';

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
      // customStickerPanel: renderCustomStickerPanel,
      // config: const TIMUIKitChatConfig(
      //   // 仅供演示，非全部配置项，实际使用中，可只传和默认项不同的参数，无需传入所有开关
      //   isAllowClickAvatar: true,
      //   isUseDefaultEmoji: true,
      //   isAllowLongPressMessage: true,
      //   isShowReadingStatus: true,
      //   isShowGroupReadingStatus: true,
      //   notificationTitle: "",
      //   isUseMessageReaction: true,
      //   groupReadReceiptPermissionList: [
      //     GroupReceiptAllowType.work,
      //     GroupReceiptAllowType.meeting,
      //     GroupReceiptAllowType.public
      //   ],
      // ),
      appBarConfig: AppBar(
        actions: [
          IconButton(
              padding: const EdgeInsets.only(left: 8, right: 16),
              onPressed: () async {

                  final String? groupID = selectedConversation?.groupID;
                  if (groupID != null) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Scaffold(
                              appBar: AppBar(title: Text(groupID)),
                              body: TIMUIKitGroupProfileExample(
                                groupID: groupID,
                              )),
                        ));
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
