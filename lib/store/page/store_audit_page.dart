import 'dart:io';

import 'package:deerflutter/application.dart';
import 'package:deerflutter/shop/shop_router.dart';
import 'package:deerflutter/store/store_router.dart';
import 'package:deerflutter/util/image_utils.dart';
import 'package:deerflutter/util/log_utils.dart';
import 'package:deerflutter/util/toast.dart';
import 'package:deerflutter/widgets/SelectImage.dart';
import 'package:deerflutter/widgets/app_bar.dart';
import 'package:deerflutter/widgets/select_text.dart';
import 'package:deerflutter/widgets/textfield_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_2d_amap/flutter_2d_amap.dart';
import 'package:image_picker/image_picker.dart';

class StoreAuditPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StoreAuditPageState();
  }
}

class _StoreAuditPageState extends State<StoreAuditPage> {
  File _imgFile;
  TextEditingController storeNameController = new TextEditingController();
  String sortName = "请请输入经验范围";
  String address = "请输入地址";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        isBack: true,
        centerTitle: '店铺审核资料',
        onPressed: () {
          Application.router.pop(context);
        },
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '店铺资料',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
          ),
          SelectImage(),
          buildStoreName(),
          SelectText(
            title: "主营范围",
            hitText: sortName,
            onTap: () => selectContent(),
          ),
          SelectText(
            title: "店铺地址",
            hitText: address,
            onTap: () {
              Application.router
                  .navigateTo(context, ShopRouter.addressSelectPage)
                  .then((value) => {
                setState(() {
                  PoiSearch model = value;
                  Log.e(model.toString());
                  address = model.provinceName +
                      ' ' +
                      model.cityName +
                      ' ' +
                      model.adName +
                      ' ' +
                      model.title;
                })
              });
            },
          ),
          Text(
            '店主信息',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
          ),
          TextFieldItem(title: '店主姓名', hitStr: sortName),
          TextFieldItem(title: '联系电话', hitStr: '请输入联系电话'),
          Container(
            width: double.infinity,
            height: 20,
          ),
          FlatButton(
              onPressed: () {
                Application.router.navigateTo(context, StoreRouter.auditResultPage);
              },
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 48,
                color: Colors.blue,
                child: Text(
                  '提交',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ))
        ],
      ),
    );
  }

  //==================
  Widget buildStoreName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 10),
          child: Text(
            '店铺名称',
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.normal),
          ),
        ),
        Expanded(
            flex: 1,
            child: TextField(
              autofocus: false,
              controller: storeNameController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  hintText: '请输入店铺名称',
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1),
                  )),
            )),
      ],
    );
  }

  String _sortName = '';
  var _list = [
    '水果生鲜',
    '家用电器',
    '休闲食品',
    '茶酒饮料',
    '美妆个护',
    '粮油调味',
    '家庭清洁',
    '厨具用品',
    '儿童玩具',
    '床上用品'
  ];

  selectContent() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            height: 360,
            child: ListView.builder(
                key: const Key('goods_sotr'),
                itemExtent: 48,
                itemCount: _list.length,
                itemBuilder: (_, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        sortName = _list[index];
                      });
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      alignment: Alignment.centerLeft,
                      child: Text(_list[index]),
                    ),
                  );
                }),
          );
        });
  }
}
