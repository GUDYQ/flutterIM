// ignore_for_file: file_names, avoid_print
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:tencent_cloud_chat_uikit/ui/views/TIMUIKitConversation/tim_uikit_conversation.dart';
import 'ChatPage.dart';

class ConversationPage extends StatelessWidget {
  const ConversationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TIMUIKitConversation(
      onTapItem: (value) {
        Get.to(() => ChatPage(selectedConversation: value));
      },
    );
  }
}
