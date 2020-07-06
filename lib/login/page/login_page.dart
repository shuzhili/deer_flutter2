import 'package:deerflutter/application.dart';
import 'package:deerflutter/login/login_router.dart';
import 'package:deerflutter/store/store_router.dart';
import 'package:deerflutter/widgets/app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:flustars/flustars.dart' as FlutterStars;

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    phoneController.addListener(() {
      print(phoneController.text);
    });
    passwordController.addListener(() {
      print(passwordController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        isBack: false,
        actionName: '验证码登录',
        onPressed: () {
          FocusScope.of(context).unfocus();
          Application.router
              .navigateTo(context, LoginRouter.smsLoginPage, replace: false);
        },
      ),
      body: FormKeyboardActions(
        child: _buildbody(),
      ),
    );
  }

  Widget _buildbody() {
    return Padding(
      padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '密码登录',
            style: TextStyle(
                fontSize: 26,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold),
          ),
          TextField(
            controller: phoneController,
            autofocus: true,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
                hintText: '输入手机号',
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.yellow, width: 0.8))),
          ),
          TextField(
            controller: passwordController,
            autofocus: true,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
                hintText: '输入密码',
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.yellow, width: 0.8))),
          ),
          Container(
            height: 10,
            width: double.infinity,
          ),
          FlatButton(
            onPressed: () {
              _login();
            },
            color: Colors.blue,
            disabledColor: Colors.blue,
            child: Container(
              height: 48,
              width: double.infinity,
              alignment: Alignment.center,
              child: Text('登录'),
            ),
          ),
          Container(
            height: 40.0,
            alignment: Alignment.centerRight,
            child: GestureDetector(
              child: Text("忘记密码"),
              onTap: () {
                Application.router
                    .navigateTo(context, LoginRouter.smsLoginPage);
              },
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: GestureDetector(
              child: Text(
                '还没账号？快去注册',
                style: TextStyle(color: Colors.blue),
              ),
              onTap: () {
                Application.router
                    .navigateTo(context, LoginRouter.registerPage);
              },
            ),
          )
        ],
      ),
    );
  }

  _login() {
    FlutterStars.SpUtil.putString("phone", phoneController.text);
    Application.router.navigateTo(context, StoreRouter.auditPage);
  }
}
