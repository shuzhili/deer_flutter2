import 'package:deerflutter/res/dimens.dart';
import 'package:deerflutter/util/image_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StateLayout extends StatefulWidget {
  final StateType type;
  final String hintText;

  StateLayout({Key key, @required this.type, this.hintText}) : super(key: key);

  @override
  State<StatefulWidget> createState() => StateLayoutState();
}

class StateLayoutState extends State<StateLayout> {
  String _img;
  String _hintText;

  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case StateType.order:
        _img = 'zwdd';
        _hintText = '暂无订单';
        break;
      case StateType.goods:
        _img = 'zwsp';
        _hintText = '暂无商品';
        break;
      case StateType.network:
        _img = 'zwwl';
        _hintText = '无网络连接';
        break;
      case StateType.message:
        _img = 'zwxx';
        _hintText = '暂无消息';
        break;
      case StateType.account:
        _img = 'zwzh';
        _hintText = '马上添加提现账号吧';
        break;
      case StateType.loading:
        _img = '';
        _hintText = '';
        break;
      case StateType.empty:
        _img = '';
        _hintText = '';
        break;
    }
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          widget.type == StateType.loading
              ? CupertinoActivityIndicator(
                  radius: 16.0,
                )
              : (widget.type) == StateType.empty
                  ? SizedBox()
                  : Opacity(
                      opacity: 0.5,
                      child: Container(
                        height: 120.0,
                        width: 120.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    ImageUtils.getAssetImage('state/$_img'))),
                      ),
                    ),
          Text(widget.hintText ?? _hintText,
              style: Theme.of(context)
                  .textTheme
                  .subtitle
                  .copyWith(fontSize: Dimens.font_sp14)),
        ],
      ),
    );
  }
}

enum StateType { order, goods, network, message, account, loading, empty }
