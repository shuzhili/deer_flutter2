import 'package:deerflutter/application.dart';
import 'package:deerflutter/login/login_router.dart';
import 'package:deerflutter/store/store_router.dart';
import 'package:deerflutter/widgets/app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmsLoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SmsLoginPageState();
  }
}

class _SmsLoginPageState extends State<SmsLoginPage> {
  TextEditingController phoneEditingController = new TextEditingController();
  TextEditingController smsEditingController = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    phoneEditingController.addListener(() {});
    smsEditingController.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        isBack: true,
        onPressed: () {
          Application.router.pop(context);
        },
      ),
      body: _build(),
    );
  }

  _build() {
    return Container(
      padding: EdgeInsets.only(left: 16, top: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '验证码登录',
            style: TextStyle(
                color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold),
          ),
          TextField(
            controller: phoneEditingController,
            textInputAction: TextInputAction.done,
            textDirection: TextDirection.ltr,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
                hintText: "请输入手机号",
                floatingLabelBehavior: FloatingLabelBehavior.auto),
          ),
          Stack(
            alignment: Alignment.centerRight,
            children: [
              TextField(
                controller: smsEditingController,
                textInputAction: TextInputAction.done,
                textDirection: TextDirection.ltr,
                decoration: InputDecoration(
                    hintText: "请输入验证码",
                    floatingLabelBehavior: FloatingLabelBehavior.auto),
              ),
              Container(
                  height: 30,
                  width: 80,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(width: 2, color: Colors.blue),
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: GestureDetector(
                    onTap: () {},
                    child: Text("获取验证码"),
                  ))
            ],
          ),
          Container(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () {
                  Application.router
                      .navigateTo(context, LoginRouter.registerPage);
                },
                child: RichText(
                  text: TextSpan(
                    text: '提示：未注册手机号请先',
                    style: TextStyle(color: Colors.grey),
                    children: [
                      TextSpan(text: '注册', style: TextStyle(color: Colors.blue))
                    ],
                  ),
                ),
              )),
          FlatButton(
            padding: EdgeInsets.only(top: 20),
            onPressed: (){
              Application.router.navigateTo(context, StoreRouter.auditPage);
            },
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 48,
              color: Colors.blue,
              child: Text('登录'),
            ),
          )
        ],
      ),
    );
  }
}
