import 'package:deerflutter/application.dart';
import 'package:deerflutter/order/pay_type_dialog.dart';
import 'package:deerflutter/res/dimens.dart';
import 'package:deerflutter/res/gaps.dart';
import 'package:deerflutter/util/toast.dart';
import 'package:deerflutter/util/utils.dart';
import 'package:deerflutter/widgets/my_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatefulWidget {
  final int tabIndex;
  final int index;

  OrderItem({Key key, this.tabIndex, this.index}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8.0),
      child: MyCard(
          color: Colors.white,
          child: Container(
            padding: EdgeInsets.all(16),
            child: InkWell(
              onTap: () {
//            Application.router.navigateTo(context, OrderRouter.orderInfoPage);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(child: Text('1333333333333(李四)')),
                      Text(
                        '货到付款',
                        style: TextStyle(
                          fontSize: Dimens.font_sp12,
                          color: Theme.of(context).errorColor,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 8,
                    width: double.infinity,
                  ),
                  Text(
                    '北京市海淀区 黑龙潭路58',
                    style: Theme.of(context).textTheme.subtitle,
                  ),
                  SizedBox(
                    height: 8,
                    width: double.infinity,
                  ),
                  Gaps.line,
                  Gaps.vGap8,
                  RichText(
                    text: TextSpan(
                        style: Theme.of(context)
                            .textTheme
                            .body1
                            .copyWith(fontSize: Dimens.font_sp14),
                        children: [
                          TextSpan(text: '卫龙辣条'),
                          TextSpan(
                              text: '  x2',
                              style: Theme.of(context).textTheme.subtitle)
                        ]),
                  ),
                  Gaps.vGap8,
                  Row(
                    children: [
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  .copyWith(fontSize: Dimens.font_sp12),
                              children: [
                                TextSpan(text: "\$12"),
                                TextSpan(
                                    text: " 共100件商品",
                                    style: TextStyle(
                                        fontSize: Dimens.font_sp10,
                                        color: Colors.grey)),
                              ]),
                        ),
                      ),
                      Text(
                        '2020-7-11 14:00',
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                  Gaps.vGap8,
                  Gaps.line,
                  Row(
                    children: [
                      OrderItemButton(
                        text: '联系客户',
                        textColor: Colors.black,
                        bgColor: Colors.white,
                        onTap: () =>
                            _showCallPhoneDialog(context, '13333333333'),
                      ),
                      Expanded(
                        child: Gaps.empty,
                      ),
                      OrderItemButton(
                        text: '单据',
                        textColor: Colors.black,
                        bgColor: Colors.white,
                        onTap: () {
//                          if (tabIndex >= 2) {
//                            NavigatorUtils.push(context, OrderRouter.orderTrackPage);
//                          }
                        },
                      ),
                      OrderItemButton(
                        text: '接单',
                        textColor: Colors.white,
                        bgColor: Colors.blue,
                        onTap: () {
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return PayTypeDialog(
                                  onPressed: (index, type) {
                                    Toast.show('收款类型：$type');
                                  },
                                );
                              });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }

  _showCallPhoneDialog(BuildContext context, String str) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('提示'),
            content: Text('拨打13439328295'),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('取消')),
              FlatButton(
                  onPressed: () {
                    Utils.launchTelURL('13439328295');
                    Navigator.pop(context);
                  },
                  child: Text('拨打')),
            ],
          );
        });
  }
}

class OrderItemButton extends StatelessWidget {
  final Color bgColor;
  final Color textColor;
  final GestureTapCallback onTap;
  final String text;

  OrderItemButton(
      {Key key, this.bgColor, this.textColor, this.onTap, this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 14.0),
        decoration: BoxDecoration(
            color: bgColor, borderRadius: BorderRadius.circular(5.0)),
        constraints:
            BoxConstraints(minWidth: 64.0, maxHeight: 30.0, minHeight: 30.0),
        child: Text(
          text,
          style: TextStyle(fontSize: Dimens.font_sp16, color: textColor),
        ),
      ),
    );
  }
}
