// ignore_for_file: avoid_print

import 'GenerateUserSig.dart';
import 'TIMUIKitChatExample.dart';
import 'TIMUIKitConversationExample.dart';
import 'TIMUIKitProfileExample.dart';
import 'package:flutter/material.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';
import 'TIMUIKitAddFriendExample.dart';
import 'TIMUIKitAddGroupExample.dart';
import 'TIMUIKitBlackListExample.dart';
import 'TIMUIKitContactExample.dart';
import 'TIMUIKitGroupExample.dart';
import 'TIMUIKitGroupProfileExample.dart';
import 'TIMUIKitNewContactExample.dart';
import 'TIMUIKitSearchExample.dart';
import '../page/FriendProfile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tencent IM UIKit',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Tencent Cloud Chat UIKit'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    initTIMUIKIT();
  }

  CoreServicesImpl timCoreInstance = TIMUIKitCore.getInstance();

  int getSDKAPPID() {
    return const int.fromEnvironment('SDK_APPID', defaultValue: 1400813647);
  }

  String getUserID() {
    return const String.fromEnvironment('LOGINUSERID', defaultValue: "admin");
  }

  String getSecret() {
    return const String.fromEnvironment('SECRET', defaultValue: "2a6d6368f68da55dbd07b4b8cbd6e42dd2531527aa95e5849e7ce21015c5ce79");
  }

  initTIMUIKIT() async {
    int sdkappid = getSDKAPPID();
    String userid = getUserID();
    String secret = getSecret();
    // String usersig = GenerateTestUserSig(sdkappid: sdkappid, key: secret)
    //     .genSig(identifier: userid, expire: 24 * 7 * 60 * 60 * 1000);
    // if (sdkappid == 0 || userid == '' || secret == '' || usersig == '') {
    //   print("The running parameters are abnormal, please check");
    //   return;
    // }
    String usersig = "eJyrVgrxCdYrSy1SslIy0jNQ0gHzM1NS80oy0zLBwokpuZl5UInilOzEgoLMFCUrQxMDAwtDYzMTc4hMakVBZlEqUNzU1NTIwMAAIlqSmQsSM7MwNTY3MDG3hJqSmQ40N0bf2NvH3yndoCDHMTjbWzs9wCXc0TzQsMi3KiC93L2wMistp7C4KD01KaTYVqkWAE92Mk8_";
    await timCoreInstance.init(
      sdkAppID: sdkappid,
      loglevel: LogLevelEnum.V2TIM_LOG_DEBUG,
      listener: V2TimSDKListener(
        onConnectFailed: (code, error) {},
        onConnectSuccess: () {},
        onConnecting: () {},
        onKickedOffline: () {},
        onSelfInfoUpdated: (V2TimUserFullInfo info) {},
        onUserSigExpired: () {},
      ),
    );
    V2TimCallback res =
    await timCoreInstance.login(userID: userid, userSig: usersig);
    print(
        "Log in to Tencent Cloud Instant Messaging IM Return：${res.toJson()}");
  }

  getAPIWidget(String apiName) {
    V2TimConversation conversation = V2TimConversation(conversationID: "c2c_yyq", type: 1, userID: "yyq");
    switch (apiName) {
      case 'TIMUIKitConversation':
        return const TIMUIKitConversationExample();
      case 'TIMUIKitChat':
        return const TIMUIKitChatExample();
      case 'TIMUIKitProfile':
        return const FriendProfile(key: Key('联系人'), userID: 'yyq');
      case 'TIMUIKitAddFriend':
        return const TIMUIKitAddFriendExample();
      case 'TIMUIKitAddGroup':
        return const TIMUIKitAddGroupExample();
      case 'TIMUIKitBlackList':
        return const TIMUIKitBlackListExample();
      case 'TIMUIKitContact':
        return const TIMUIKitContactExample();
      case 'TIMUIKitGroup':
        return const TIMUIKitGroupExample();
      case 'TIMUIKitGroupProfile':
        return const TIMUIKitGroupProfileExample(key: Key("芝士雪豹"), groupID: "@TGS#1NTVNUXMB");
      case 'TIMUIKitNewContact':
        return const TIMUIKitNewContactExample();
      case 'TIMUIKitSearch':
        return const TIMUIKitSearchExample();
    }
  }

  openExamplePage(String apiName) {
    if (apiConfig.contains(apiName)) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: Text(apiName),
            ),
            body: getAPIWidget(apiName),
          ),
        ),
      );
    } else {
      print("no such ket");
    }
  }

  List<String> apiConfig = [
    "TIMUIKitConversation",
    "TIMUIKitChat",
    "TIMUIKitProfile",
    "TIMUIKitAddFriend",
    "TIMUIKitAddGroup",
    "TIMUIKitBlackList",
    "TIMUIKitContact",
    "TIMUIKitGroup",
    "TIMUIKitGroupProfile",
    "TIMUIKitNewContact",
    "TIMUIKitSearch"
  ];
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            children: apiConfig
                .map(
                  (e) => Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        openExamplePage(e);
                      },
                      child: Text(e),
                    ),
                  )
                ],
              ),
            )
                .toList(),
          ),
        ),
      ),
    );
  }
}