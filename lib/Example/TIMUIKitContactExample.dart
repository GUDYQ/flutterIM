// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';
import 'package:tencent_cloud_chat_uikit/ui/widgets/avatar.dart';

import 'TIMUIKitGroupExample.dart';
import 'TIMUIKitNewContactExample.dart';
import 'TIMUIKitProfileExample.dart';


class TIMUIKitContactExample extends StatelessWidget {
  const TIMUIKitContactExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _topListItemTap(String id) {
      switch (id) {
        case "newContact":
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TIMUIKitNewContactExample(),
              ));
          break;
        case "groupList":
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TIMUIKitGroupExample(),
              ));
          break;
      }
    }

    String _getImagePathByID(String id) {
          return "";
      }


    Widget? _topListBuilder(TopListItem item) {
      final showName = item.name;

      return InkWell(
        onTap: () {
          _topListItemTap(item.id);
        },
        child: Container(
          padding: const EdgeInsets.only(top: 10, left: 16),
          child: Row(
            children: [
              Container(
                height: 40,
                width: 40,
                margin: const EdgeInsets.only(right: 12),
                child: Avatar(
                  faceUrl: _getImagePathByID(item.id),
                  showName: showName,
                ),
              ),
              Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(top: 10, bottom: 19),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: hexToColor("DBDBDB")))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          showName,
                          style:
                          TextStyle(color: hexToColor("111111"), fontSize: 18),
                        ),
                        Expanded(child: Container()),
                        const TIMUIKitUnreadCount(),
                        Container(
                          margin: const EdgeInsets.only(right: 16),
                          child: Icon(
                            Icons.keyboard_arrow_right,
                            color: hexToColor('BBBBBB'),
                          ),
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      );
    }

    return TIMUIKitContact(
      topList: [
        TopListItem(
          name: ("新的联系人"),
          id: "newContact",
          icon: Image.asset(_getImagePathByID("newContact")),
        ),
        TopListItem(
          name: ("我的群聊"),
          id: "groupList",
          icon: Image.asset(_getImagePathByID("groupList")),
        )
      ],
      topListItemBuilder: _topListBuilder,
      onTapItem: (item) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TIMUIKitChat(conversation: V2TimConversation(
                  conversationID: "c2c_${item.userID}",
                  userID: item.userID,
                  showName: item.userID,
                  type: 1)),
            ));
      },
      emptyBuilder: (context) => Center(
        child: Text(("无联系人")),
      ),
    );
  }
}
