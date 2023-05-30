// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';
import 'package:tencent_cloud_chat_uikit/ui/widgets/avatar.dart';

import 'FriendProfile.dart';
import 'GroupPage.dart';


class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _topListItemTap(String id) {
      switch (id) {
        case "newContact":
          Get.to(() => const ContactPage());
          break;
        case "groupList":
          Get.to(() => const GroupPage(key: Key("groupList")));
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
        // TopListItem(
        //   name: ("新的联系人"),
        //   id: "newContact",
        //   icon: Image.asset(_getImagePathByID("newContact")),
        // ),
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
              builder: (context) => FriendProfile(
                userID: item.userID,
              ),
            ));
      },
      emptyBuilder: (context) => Center(
        child: Text(("无联系人")),
      ),
    );
  }
}
