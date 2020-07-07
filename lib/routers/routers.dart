import 'package:deerflutter/login/login_router.dart';
import 'package:deerflutter/routers/router_init.dart';
import 'package:deerflutter/store/store_router.dart';
import 'package:fluro/fluro.dart';
import 'package:fluro/src/router.dart';
import 'package:flutter/cupertino.dart';

import '404.dart';

class Routers {
  static String home = '/home';
  static String webViewPage = '/webview';
  Router router;
  static List<IRouterProvider> _listRouter = [];

  static void configRouters(Router router) {
    router.notFoundHandler = Handler(handlerFunc:
        (BuildContext context, Map<String, List<String>> parameter) {
      debugPrint("未找到页面");
      return WidgetNotFound();
    });

//    router.define(home, handler: Handler(handlerFunc: (_,param)=>Home()));
//    router.define(webViewPage, handler: Handler(handlerFunc: (_,param){
//      String title=param['title']?.first;
//      String url=param['url']?.first;
//      return WebViewPage(title:title,url:url);
//    }));

    _listRouter.add(LoginRouter());
    _listRouter.add(StoreRouter());
    _listRouter.forEach((element) {
      element.initRouter(router);
    });
  }
}
