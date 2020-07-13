import 'package:deerflutter/application.dart';
import 'package:deerflutter/util/toast.dart';
import 'package:deerflutter/widgets/app_bar.dart';
import 'package:deerflutter/widgets/load_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'goods_router.dart';

class GoodsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GoodsPageState();
  }
}

class GoodsPageState extends State<GoodsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            tooltip: '搜索商品',
            onPressed: () {
              Application.router.navigateTo(context, GoodsRouter.goodsPage);
            },
            icon: LoadAssetImage(
              'goods/search',
              width: 24.0,
              height: 24.0,
              color: Colors.white,
            ),
          ),
          IconButton(
            tooltip: '添加商品',
            onPressed: () {
              Toast.show('添加商品');
            },
            icon: LoadAssetImage(
              'goods/add',
              width: 24.0,
              height: 24.0,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
