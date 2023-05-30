import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  LoginPageState createState() => LoginPageState();

}

class LoginPageState extends State<LoginPage> {
  final GlobalKey _formKey = GlobalKey<FormState>();
  late String _email, _password;
  bool _isObscure = true, _checked = false;
  Color _eyeColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            const SizedBox( height: kToolbarHeight),
            buildTitle(),
            buildTitleLine(),
            const SizedBox(height: 60),
            buildEmailTextField(),
            const SizedBox(height: 30),
            buildPasswordTextField(context),
            buildForgetPasswordText(context),
            const SizedBox(height: 60),
            buildLoginButton(context),
            const SizedBox(height: 40),
            buildRegisterText(context),
            const SizedBox(height: 100),
            buildPrivacyText(context),
          ],
        ),

      ),
    );
  }
  Widget buildPrivacyText(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Checkbox(
            value: _checked,
            onChanged: (value) {
              setState(() {
                _checked = !_checked;
              });
            }),
        const Text(
          '同意',
          style: TextStyle(fontSize: 14),
        ),
        const Text(
          '<服务协议>',
          style: TextStyle(fontSize: 14, color: Colors.blue),
        ),
        const Text(
          '和',
          style: TextStyle(fontSize: 14),
        ),
        const Text('<隐私政策>', style: TextStyle(fontSize: 14, color: Colors.blue)),
      ],
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
          child:
          Text('登录', style: Theme.of(context).primaryTextTheme.headline5),
          onPressed: () {
            if ((_formKey.currentState as FormState).validate()) {
              (_formKey.currentState as FormState).save();
              print('email: $_email, password: $_password');
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

  Widget buildEmailTextField() {
    return TextFormField(
      validator: (v) {},
      onSaved: (v) => _email = v!,
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
