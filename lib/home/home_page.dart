import 'package:deerflutter/anylise/anylise_page.dart';
import 'package:deerflutter/goods/goods_page.dart';
import 'package:deerflutter/home/home_provider.dart';
import 'package:deerflutter/order/order_page.dart';
import 'package:deerflutter/res/colors.dart';
import 'package:deerflutter/shop/shop_page.dart';
import 'package:deerflutter/util/double_tap_exit_app.dart';
import 'package:deerflutter/widgets/load_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<BottomNavigationBarItem> _list;
  var _appBarTitles = ['订单', '商品', '统计', '店铺'];
  int currentIndex = 0;
  HomeProvider provider = HomeProvider();

  var _pageList;
  final _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _list = _getlistItem();
    _pageList = [OrderPage(), GoodsPage(), AnylisePage(), ShopPage()];
  }

  List<BottomNavigationBarItem> _getlistItem() {
    var _tabImages = [
      [
        const LoadAssetImage(
          'home/icon_order',
          width: 25.0,
          color: Colours.unselected_item_color,
        ),
        const LoadAssetImage(
          'home/icon_order',
          width: 25.0,
          color: Colours.app_main,
        ),
      ],
      [
        const LoadAssetImage(
          'home/icon_commodity',
          width: 25.0,
          color: Colours.unselected_item_color,
        ),
        const LoadAssetImage(
          'home/icon_commodity',
          width: 25.0,
          color: Colours.app_main,
        ),
      ],
      [
        const LoadAssetImage(
          'home/icon_statistics',
          width: 25.0,
          color: Colours.unselected_item_color,
        ),
        const LoadAssetImage(
          'home/icon_statistics',
          width: 25.0,
          color: Colours.app_main,
        ),
      ],
      [
        const LoadAssetImage(
          'home/icon_shop',
          width: 25.0,
          color: Colours.unselected_item_color,
        ),
        const LoadAssetImage(
          'home/icon_shop',
          width: 25.0,
          color: Colours.app_main,
        ),
      ]
    ];
    List<BottomNavigationBarItem> lsit = List.generate(4, (index) {
      return BottomNavigationBarItem(
        icon: _tabImages[index][0],
        activeIcon: _tabImages[index][1],
        title: Padding(
          padding: EdgeInsets.only(top: 15),
          child: Text(_appBarTitles[index]),
        ),
      );
    });
    return lsit;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeProvider>(
      create: (_) => provider,
      child: DoubleTapBackExitApp(
        child: Scaffold(
          bottomNavigationBar: Consumer<HomeProvider>(
            builder: (_, provider, __) {
              return BottomNavigationBar(
                items: _list,
                type: BottomNavigationBarType.fixed,
                currentIndex: provider.value,
                selectedItemColor: Colors.blue,
                unselectedItemColor: Colors.grey,
                onTap: (index) {
                  _pageController.jumpToPage(index);
                },
              );
            },
          ),
          body: PageView(
            controller: _pageController,
            children: _pageList,
            onPageChanged: _onPageChanged,
          ),
        ),
      ),
    );
  }

  void _onPageChanged(int index) {
    provider.value = index;
  }
}
