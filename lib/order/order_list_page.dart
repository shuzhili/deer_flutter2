import 'package:deerflutter/widgets/state_layout.dart';
import 'package:flutter/cupertino.dart';

import 'order_item.dart';

class OrderListPage extends StatefulWidget {
  final int index;

  const OrderListPage({Key key, @required this.index}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _OrderListPageState();
}

class _OrderListPageState extends State<OrderListPage> {
  ScrollController _controller = ScrollController();
  List _list = [];
  StateType _stateType = StateType.loading;

  @override
  void initState() {
    super.initState();
    _onRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _controller,
      slivers: [
        SliverOverlapInjector(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          sliver: _list.isEmpty
              ? SliverFillRemaining(
                  child: StateLayout(type: _stateType),
                )
              : SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return index<_list.length?OrderItem():Text('loadingmore');
                  }, childCount: _list.length + 1),
                ),
        ),
      ],
    );
  }

  int _page = 1;
  int maxPage = 10;
  bool isLoading = false;

  Future _onRefresh() async {
    await Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _page = 1;
        _list = List.generate(10, (index) => 'newItem$index');
      });
    });
  }

  bool hasMore() {
    return _page < maxPage;
  }

  Future loadMore() async {
    if (isLoading) {
      return;
    }
    if (!hasMore()) {
      return;
    }
    isLoading = true;
    await Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _list.addAll(List.generate(10, (index) => 'newitem%index'));
        _page++;
        isLoading = false;
      });
    });
  }
}
