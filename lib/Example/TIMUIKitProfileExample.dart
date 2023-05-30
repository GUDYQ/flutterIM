// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';
import 'package:tencent_cloud_chat_uikit/ui/views/TIMUIKitProfile/profile_widget.dart';

class TIMUIKitProfileExample extends StatelessWidget {
  final String? userID;
  const TIMUIKitProfileExample({Key? key, this.userID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TIMUIKitProfile(
      userID: userID ?? "admin", // Please fill in here according to the actual cleaning
      profileWidgetsOrder: const [ProfileWidgetEnum.userInfoCard, ProfileWidgetEnum.userAccountBar, ProfileWidgetEnum.nicknameBar, ProfileWidgetEnum.genderBar, ProfileWidgetEnum.birthdayBar]
    );
  }
}
