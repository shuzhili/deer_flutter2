import 'dart:async';

import 'package:deerflutter/common/common.dart';
import 'package:deerflutter/login/login_router.dart';
import 'package:deerflutter/provider/theme_provider.dart';
import 'package:deerflutter/routers/fluro_naviagtator.dart';
import 'package:deerflutter/util/image_utils.dart';
import 'package:deerflutter/widgets/load_image.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashPageState();
  }
}

class SplashPageState extends State<SplashPage> {
  int _status = 0;
  List<String> _guidList = ['app_start_1', 'app_start_2', 'app_start_3'];
  StreamSubscription _subscription;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await SpUtil.getInstance();
      Provider.of<ThemeProvider>(context, listen: false).syncTheme();
      if (SpUtil.getBool(Constant.keyGuide, defValue: true)) {
        _guidList.forEach((element) {
          precacheImage(ImageUtils.getAssetImage(element), context);
        });
      }

      _initSplash();
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  void _initGuid() {
    setState(() {
      _status = 1;
    });
  }

  void _initSplash() {
    _subscription =
        Observable.just(1).delay(Duration(milliseconds: 1500)).listen((event) {
      if (SpUtil.getBool(Constant.keyGuide, defValue: true)) {
        SpUtil.putBool(Constant.keyGuide, false);
        _initGuid();
      } else {
        _goLogin();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: _status == 0
          ? FractionallySizedBox(
              child: const LoadAssetImage('logo'),
              heightFactor: 0.33,
              widthFactor: 0.33,
              alignment: Alignment.bottomCenter,
            )
          : Swiper(
              itemCount: _guidList.length,
              itemBuilder: (context, index) {
                return LoadAssetImage(
                  _guidList[index],
                  key: Key(_guidList[index]),
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                );
              },
              onTap: (index) {
                if (index == _guidList.length - 1) {
                  _goLogin();
                }
              },
            ),
    );
  }

  _goLogin() {
    NavigatorUtils.push(context, LoginRouter.loginPage, replace: true);
  }
}
