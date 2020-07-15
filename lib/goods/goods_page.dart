import 'package:deerflutter/application.dart';
import 'package:deerflutter/res/dimens.dart';
import 'package:deerflutter/res/gaps.dart';
import 'package:deerflutter/util/toast.dart';
import 'package:deerflutter/widgets/app_bar.dart';
import 'package:deerflutter/widgets/load_image.dart';
import 'package:deerflutter/widgets/popup_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'goods_provider.dart';
import 'goods_router.dart';

class GoodsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GoodsPageState();
  }
}

class GoodsPageState extends State<GoodsPage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  List<String> _sortList = [
    '全部商品',
    '个人护理',
    '饮料',
    '沐浴洗护',
    '厨房用具',
    '休闲食品',
    '生鲜水果',
    '酒水',
    '家庭清洁'
  ];
  GlobalKey _addKey = GlobalKey();
  GlobalKey _bodyKey = GlobalKey();
  GlobalKey _buttonKey = GlobalKey();
  GoodsPageProvider provider = GoodsPageProvider();

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GoodsPageProvider>(
      create: (_) => provider,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
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
                color: Colors.black,
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
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: Column(
          key: _bodyKey,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Semantics(
              container: true,
              label: '选择商品类型',
              child: GestureDetector(
                key: _buttonKey,
                child: Selector<GoodsPageProvider, int>(
                  selector: (_, provider) => provider.sortIndex,

                  /// 精准判断刷新条件（provider 4.0新属性）
//                  shouldRebuild: (previous, next) => previous != next,
                  builder: (_, sortIndex, __) {
                    // 只会触发sortIndex变化的刷新
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding:
                          const EdgeInsets.only(left: 16.0, right: 8.0),
                          child: Text(
                            _sortList[sortIndex],
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        LoadAssetImage(
                          'goods/expand',
                          width: 16.0,
                          height: 16.0,
                          color: Colors.black,
                        )
                      ],
                    );
                  },
                ),
                onTap: () => _showSortMenu(),
              ),
            ),
            Gaps.vGap16,
            _buildTabView(),

          ],
        ),
      ),
    );
  }

  Widget _buildTabView() {
    return Container(
      color: Theme
          .of(context)
          .scaffoldBackgroundColor,
      child: TabBar(onTap: (index) {},
          isScrollable: true,
          controller: _tabController,
          labelStyle: TextStyle(fontSize: 18),
          indicatorSize: TabBarIndicatorSize.label,
          labelPadding: EdgeInsets.only(left: 16),
          unselectedLabelColor: Colors.grey,
          labelColor: Colors.blue,
          indicatorPadding: EdgeInsets.only(left: 12, right: 36),
          tabs: [
            _TabView('在售', 0),
            _TabView('待售', 1),
            _TabView('下架', 2)
          ]),
    );
  }

  _showSortMenu() {
    // 获取点击控件的坐标
    final RenderBox button = _buttonKey.currentContext.findRenderObject();
    final RenderBox overlay = Overlay
        .of(context)
        .context
        .findRenderObject();
    // 获得控件左下方的坐标
    var a = button.localToGlobal(Offset(0.0, button.size.height + 12.0),
        ancestor: overlay);
    // 获得控件右下方的坐标
    var b = button.localToGlobal(button.size.bottomLeft(Offset(0, 12.0)),
        ancestor: overlay);
    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(a, b),
      Offset.zero & overlay.size,
    );
    final RenderBox body = _bodyKey.currentContext.findRenderObject();

    TextStyle textStyle = TextStyle(
      fontSize: Dimens.font_sp14,
      color: Theme
          .of(context)
          .primaryColor,
    );
    showPopupWindow(
      context: context,
      fullWidth: true,
      position: position,
      elevation: 0.0,
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          color: const Color(0x99000000),
          height: body.size.height - button.size.height - 12.0,
          child: ListView.builder(
            physics: ClampingScrollPhysics(),
            itemCount: _sortList.length + 1,
            itemBuilder: (_, index) {
              Color backgroundColor = Colors.white;
              return index == _sortList.length
                  ? Container(
                color: backgroundColor,
                height: 12.0,
              )
                  : Material(
                color: backgroundColor,
                child: InkWell(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          _sortList[index],
                          style: index == provider.sortIndex
                              ? textStyle
                              : null,
                        ),
                        Text(
                          '($index)',
                          style: index == provider.sortIndex
                              ? textStyle
                              : null,
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    provider.setSortIndex(index);
                    Navigator.pop(context);
                    Toast.show('选择分类: ${_sortList[index]}');
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class _TabView extends StatelessWidget {
  String tabName;
  int index;

  _TabView(this.tabName, this.index);

  @override
  Widget build(BuildContext context) {
    return Consumer<GoodsPageProvider>(
      builder: (_, provider, child) {
        return Tab(child: SizedBox(
          width: 78.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(tabName),
              Offstage(
                offstage: provider.goodsCountList[index] == 0 ||
                    provider.index != index,
                child: Padding(padding: EdgeInsets.only(top: 1.0),
                  child: Text('(${provider.goodsCountList[index]}件)',
                    style: TextStyle(fontSize: Dimens.font_sp12),),),

              ),
            ],
          ),
        ),);
      },
    );
  }

}