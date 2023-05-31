// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';
import 'package:tencent_cloud_chat_uikit/ui/views/TIMUIKitProfile/profile_widget.dart';
import 'package:untitled2/router.dart';

class ProfilePage extends StatelessWidget {
  final String? userID;

  const ProfilePage({Key? key, this.userID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TIMUIKitProfile(
        userID: userID ?? "admin",
        // Please fill in here according to the actual cleaning
        profileWidgetsOrder: const [
          ProfileWidgetEnum.userInfoCard,
          ProfileWidgetEnum.userAccountBar,
          ProfileWidgetEnum.nicknameBar,
          ProfileWidgetEnum.genderBar,
          ProfileWidgetEnum.birthdayBar,
          ProfileWidgetEnum.operationDivider,
        ],
      ),
      TextButton(
        onPressed: () {
          Get.offAllNamed(AppRouter.login);
        },
        style: ButtonStyle(
          minimumSize:
          MaterialStateProperty.all(const Size(double.infinity, 50)),
        ),
        child: const Text('切换账号'),
      ),
      TextButton(
        onPressed: () {
          Get.offAllNamed(AppRouter.login);
        },
        style: ButtonStyle(
          minimumSize:
              MaterialStateProperty.all(const Size(double.infinity, 50)),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
        ),
        child: const Text('注销'),
      ),
      Expanded(
        child: Container(
          color: Colors.grey[300],
        ),
      ),
    ]);
  }
}
