import 'package:deerflutter/order/order_list_page.dart';
import 'package:deerflutter/order/order_page_provider.dart';
import 'package:deerflutter/util/image_utils.dart';
import 'package:deerflutter/util/toast.dart';
import 'package:deerflutter/widgets/load_image.dart';
import 'package:deerflutter/widgets/my_card.dart';
import 'package:deerflutter/widgets/my_flexible_space_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _OrderPageState();
  }
}

class _OrderPageState extends State<OrderPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  PageController _pageController = new PageController(initialPage: 0);
  OrderPageProvider orderPageProvider = new OrderPageProvider();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 5);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _preCacheImage();
    });
  }
  _preCacheImage(){
    precacheImage(ImageUtils.getAssetImage('order/xdd_n'), context);
    precacheImage(ImageUtils.getAssetImage('order/dps_s'), context);
    precacheImage(ImageUtils.getAssetImage('order/dwc_s'), context);
    precacheImage(ImageUtils.getAssetImage('order/ywc_s'), context);
    precacheImage(ImageUtils.getAssetImage('order/yqx_s'), context);
  }
  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<OrderPageProvider>(
      create: (_) => orderPageProvider,
      child: Scaffold(
        body: Stack(
          children: [
            SafeArea(
              child: SizedBox(
                height: 105,
                width: double.infinity,
                child: const DecoratedBox(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: const [
                  Color(0xFF5793FA),
                  Color(0xFF4647FA)
                ]))),
              ),
            ),
            NestedScrollView(
              physics: ClampingScrollPhysics(),
              headerSliverBuilder: (context, innerBoxIsScrolled) =>
                  _sLiverBuilder(context),
              body: PageView.builder(
                  itemCount: 5,
                  controller: _pageController,
                  onPageChanged: _onPageChange,
                  itemBuilder: (context, index) {
                    return Center(
                      child: OrderListPage(index: index),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  _onPageChange(index) {
    orderPageProvider.setIndex(index);
    _tabController.animateTo(index);
  }

  _sLiverBuilder(BuildContext context) {
    return <Widget>[
      SliverOverlapAbsorber(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
          sliver: SliverAppBar(
            leading: SizedBox(),
            brightness: Brightness.dark,
            actions: [
              IconButton(
                icon: LoadAssetImage(
                  'order/icon_search',
                  width: 22.0,
                  height: 22.0,
                ),
                tooltip: '搜索',
                onPressed: () {
                  Toast.show('搜索');
                },
              ),
            ],
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            expandedHeight: 100.0,
            centerTitle: true,
            floating: false,
            pinned: true,
            flexibleSpace: MyFlexibleSpaceBar(
              background: LoadAssetImage(
                'order/order_bg',
                width: double.infinity,
                height: 113.0,
                fit: BoxFit.fill,
              ),
              centerTitle: true,
              titlePadding:
                  EdgeInsetsDirectional.only(start: 16.0, bottom: 14.0),
              title: Text(
                '订单',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          )),
      SliverPersistentHeader(
        pinned: true,
        delegate: SliverAppBarDelegate(
            DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                    image: ImageUtils.getAssetImage('order/order_bg1'),
                    fit: BoxFit.fill),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: MyCard(
                  color: Colors.white,
                  shadowColor: Colors.black,
                  child: Container(
                    height: 80.0,
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TabBar(
                      labelPadding: EdgeInsets.symmetric(horizontal: 0),
                      controller: _tabController,
                      labelColor: Color(0xFF333333),
                      unselectedLabelColor: Colors.grey,
                      labelStyle:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      unselectedLabelStyle: TextStyle(fontSize: 14),
                      indicatorColor: Colors.blue,
                      tabs: <Widget>[
                        _TabView(0, '新订单'),
                        _TabView(1, '带配送'),
                        _TabView(2, '待完成'),
                        _TabView(3, '已完成'),
                        _TabView(4, '已取消'),
                      ],
                      onTap: (index) {
                        _pageController.jumpToPage(index);
                      },
                    ),
                  ),
                ),
              ),
            ),
            80),
      ),
    ];
  }
}

var img = [
  ['order/xdd_s', 'order/xdd_n'],
  ['order/dps_s', 'order/dps_n'],
  ['order/dwc_s', 'order/dwc_n'],
  ['order/ywc_s', 'order/ywc_n'],
  ['order/yqx_s', 'order/yqx_n']
];

class _TabView extends StatelessWidget {
  const _TabView(this.index, this.text);

  final int index;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderPageProvider>(
      builder: (_, provider, child) {
        int selectIndex = provider.index;
        return Stack(children: [
          Container(
            width: 46.0,
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LoadAssetImage(
                  selectIndex == index ? img[index][0] : img[index][1],
                  width: 24.0,
                  height: 24.0,
                ),
                Text(text),
              ],
            ),
          ),
          child
        ]);
      },
      child: Positioned(
        right: 0.0,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Theme.of(context).errorColor,
            borderRadius: BorderRadius.circular(11.0),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.5, vertical: 2.0),
            child: Text(
              '10',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ),
      ),
    );
  }
}

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget widget;
  final double height;

  SliverAppBarDelegate(this.widget, this.height);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return widget;
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => height;

  @override
  // TODO: implement minExtent
  double get minExtent => height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
