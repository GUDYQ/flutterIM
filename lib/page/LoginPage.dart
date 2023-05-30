import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';
import 'package:untitled2/router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final GlobalKey _formKey = GlobalKey<FormState>();
  late String _username, _password;
  bool _isObscure = true;
  Color _eyeColor = Colors.grey;

  CoreServicesImpl timCoreInstance = TIMUIKitCore.getInstance();

  int getSDKAPPID() {
    return const int.fromEnvironment('SDK_APPID', defaultValue: 1400813647);
  }

  String getUserID() {
    return const String.fromEnvironment('LOGINUSERID', defaultValue: "admin");
  }

  String getSecret() {
    return const String.fromEnvironment('SECRET',
        defaultValue:
            "2a6d6368f68da55dbd07b4b8cbd6e42dd2531527aa95e5849e7ce21015c5ce79");
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
    String usersig =
        "eJyrVgrxCdYrSy1SslIy0jNQ0gHzM1NS80oy0zLBwokpuZl5UInilOzEgoLMFCUrQxMDAwtDYzMTc4hMakVBZlEqUNzU1NTIwMAAIlqSmQsSM7MwNTY3MDG3hJqSmQ40N0bf2NvH3yndoCDHMTjbWzs9wCXc0TzQsMi3KiC93L2wMistp7C4KD01KaTYVqkWAE92Mk8_";
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            const SizedBox(height: kToolbarHeight),
            buildTitle(),
            buildTitleLine(),
            const SizedBox(height: 60),
            buildUsernameTextField(),
            const SizedBox(height: 30),
            buildPasswordTextField(context),
            buildForgetPasswordText(context),
            const SizedBox(height: 60),
            buildLoginButton(context),
            const SizedBox(height: 40),
            buildRegisterText(context),
          ],
        ),
      ),
    );
  }

  Widget buildRegisterText(context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('没有账号?'),
            GestureDetector(
              child: const Text('点击注册', style: TextStyle(color: Colors.green)),
              onTap: () {
                print("点击注册");
              },
            )
          ],
        ),
      ),
    );
  }

  Widget buildLoginButton(BuildContext context) {
    return Align(
      child: SizedBox(
        height: 45,
        width: 270,
        child: ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all(const StadiumBorder(
                  side: BorderSide(style: BorderStyle.none)))),
          child: Text('登录',
              style: Theme.of(context).primaryTextTheme.headlineSmall),
          onPressed: () {
            if ((_formKey.currentState as FormState).validate()) {
              (_formKey.currentState as FormState).save();
              initTIMUIKIT();
              Get.offAndToNamed(AppRouter.home);
            }
          },
        ),
      ),
    );
  }

  Widget buildForgetPasswordText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Align(
        alignment: Alignment.centerRight,
        child: TextButton(
          onPressed: () {
            print("忘记密码");
          },
          child: const Text("忘记密码？",
              style: TextStyle(fontSize: 14, color: Colors.grey)),
        ),
      ),
    );
  }

  Widget buildPasswordTextField(BuildContext context) {
    return TextFormField(
        obscureText: _isObscure,
        onSaved: (v) => _password = v!,
        validator: (v) {
          if (v!.isEmpty) {
            return '请输入密码';
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: "密码",
          suffixIcon: IconButton(
            icon: Icon(
              Icons.remove_red_eye,
              color: _eyeColor,
            ),
            onPressed: () {
              setState(() {
                _isObscure = !_isObscure;
                _eyeColor = (_isObscure
                    ? Colors.grey
                    : Theme.of(context).iconTheme.color)!;
              });
            },
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(
              color: Colors.blue,
              width: 2.0,
            ),
          ),
        ));
  }

  Widget buildUsernameTextField() {
    return TextFormField(
      validator: (v) {
        if (v != 'admin') {
          return '用户错误';
        }
        return null;
      },
      onSaved: (v) => _username = v!,
      decoration: const InputDecoration(
        labelText: "账号",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(
            color: Colors.blue,
            width: 2.0,
          ),
        ),
      ),
    );
  }

  Widget buildTitleLine() {
    return Padding(
        padding: const EdgeInsets.only(top: 4.0),
        child: Align(
          alignment: Alignment.center,
          child: Container(
            color: Colors.black,
            width: 100,
            height: 2,
          ),
        ));
  }

  Widget buildTitle() {
    return const Padding(
        padding: EdgeInsets.all(8),
        child: Text(
          'Flutter IM',
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ));
  }
}
