import 'package:deerflutter/application.dart';
import 'package:deerflutter/store/store_router.dart';
import 'package:deerflutter/widgets/app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegistPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegistPageState();
  }
}

class _RegistPageState extends State<RegistPage> {
  TextEditingController phoneControll = new TextEditingController();
  TextEditingController verifyController = new TextEditingController();
  TextEditingController pwdController = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        isBack: true,
        title: '注册',
        onPressed: () {
          Application.router.pop(context);
        },
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            "开启你的账户",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 26),
          ),
          TextField(
            controller: phoneControll,
            autofocus: false,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              hintText: '请输入手机号',
              contentPadding: EdgeInsets.all(10),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.black, width: 1, style: BorderStyle.solid),
              ),
            ),
          ),
          Stack(
            alignment: Alignment.centerRight,
            children: [
              TextField(
                autofocus: false,
                controller: verifyController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: '请输入验证码',
                    contentPadding: EdgeInsets.all(10),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    )),
              ),
              FlatButton(
                  onPressed: () {},
                  child: Container(
                    width: 100,
                    height: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: Text(
                      '获取验证码',
                      style: TextStyle(color: Colors.white),
                    ),
                  ))
            ],
          ),
          TextField(
            autofocus: false,
            controller: pwdController,
            decoration: InputDecoration(
                hintText: '请输入密码',
                contentPadding: EdgeInsets.all(10),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1),
                )),
          ),
          Container(
            width: double.infinity,
            height: 20,
          ),
          FlatButton(
              onPressed: () {
                Application.router.navigateTo(context, StoreRouter.auditPage);
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                height: 48,
                width: double.infinity,
                child: Text(
                  '注册',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ))
        ],
      ),
    );
  }
}
