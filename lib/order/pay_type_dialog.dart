import 'package:deerflutter/res/dimens.dart';
import 'package:deerflutter/widgets/base_dialog.dart';
import 'package:deerflutter/widgets/load_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PayTypeDialog extends StatefulWidget {
  final Function(int, String) onPressed;

  PayTypeDialog({Key key, this.onPressed}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PayTypeDialog();
}

class _PayTypeDialog extends State<PayTypeDialog> {
  int _value = 0;
  var _list = ['未收款', '支付宝', '微信', '现金'];

  Widget getItem(int index) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        child: SizedBox(
          height: 42.0,
          child: Row(
            children: [
              Expanded(
                  child: Text(
                _list[index],
                style: TextStyle(
                    fontSize: Dimens.font_sp14,
                    color: Theme.of(context).primaryColor),
              )),
              Offstage(
                offstage: _value != index,
                child: LoadAssetImage(
                  'order/ic_check',
                  width: 16.0,
                  height: 16.0,
                ),
              )
            ],
          ),
        ),
        onTap: () {
          if (mounted) {
            setState(() {
              _value = index;
            });
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      title: '收款方式',
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: [
          getItem(0),
          getItem(1),
          getItem(2),
          getItem(3),
        ],
      ),
      onPressed: () {
        Navigator.pop(context);
        widget.onPressed(_value, _list[_value]);
      },
    );
  }
}
