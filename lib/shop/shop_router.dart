import 'package:deerflutter/routers/router_init.dart';
import 'package:deerflutter/shop/page/select_address_page.dart';
import 'package:fluro/fluro.dart';
import 'package:fluro/src/router.dart';

class ShopRouter implements IRouterProvider {
  static String addressSelectPage = '/shop/addressSelect';

  @override
  void initRouter(Router router) {
    router.define(addressSelectPage,
        handler: Handler(handlerFunc: (_, params) => AddressSelectPage()));
  }
}
