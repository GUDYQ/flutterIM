import 'package:flutter/material.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: TIMUIKitSearch(
      onTapConversation: (conv, message) {},
      onEnterConversation: (V2TimConversation conversation, String keyword) {},
    )));
  }
}
