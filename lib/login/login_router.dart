import 'package:deerflutter/login/page/login_page.dart';
import 'package:deerflutter/login/page/login_sms_page.dart';
import 'package:deerflutter/login/page/regist_page.dart';
import 'package:deerflutter/routers/router_init.dart';
import 'package:fluro/fluro.dart';
import 'package:fluro/src/router.dart';
import 'package:flutter/material.dart';

class LoginRouter implements IRouterProvider {
  static String loginPage = '/login';
  static String registerPage = '/login/register';
  static String smsLoginPage = '/login/smsLogin';
  static String resetPasswordPage = '/login/resetPassword';
  static String updatePasswordPage = '/login/updatePassword';

  @override
  void initRouter(Router router) {
    router.define(loginPage,
        handler: Handler(handlerFunc: (_, param) => LoginPage()));

    router.define(smsLoginPage,
        handler: Handler(handlerFunc: (_, param) => SmsLoginPage()));

    router.define(registerPage,
        handler: Handler(handlerFunc: (_, param) => RegistPage()));
  }
}
