import 'package:deerflutter/res/colors.dart';
import 'package:deerflutter/widgets/load_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<BottomNavigationBarItem> _list;
  var _appBarTitles = ['订单', '商品', '统计', '店铺'];
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _list = _getlistItem();
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
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: _list,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) {

        },
      ),
      body: PageView(),
    );
  }
}
