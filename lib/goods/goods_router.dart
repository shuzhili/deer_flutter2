import 'package:deerflutter/routers/router_init.dart';
import 'package:fluro/fluro.dart';
import 'package:fluro/src/router.dart';

import 'goods_page.dart';

class GoodsRouter implements IRouterProvider {
  static String goodsPage = '/goods';
  static String goodsEditPage = '/goods/edit';
  static String goodsSearchPage = 'goods/size';
  static String goodsSizeEditPage = '/goods/sizeEdit';

  @override
  void initRouter(Router router) {
    router.define(goodsPage, handler: Handler(handlerFunc: (_,params)=>GoodsPage()));



























  }
}
