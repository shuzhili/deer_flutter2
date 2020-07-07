import 'package:deerflutter/application.dart';
import 'package:deerflutter/util/image_utils.dart';
import 'package:deerflutter/widgets/app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StoreAuditPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StoreAuditPageState();
  }
}

class _StoreAuditPageState extends State<StoreAuditPage> {
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
          buildSelectImg(),
        ],
      ),
    );
  }

  Widget buildSelectImg() {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              _selectImg();
            },
            borderRadius: BorderRadius.circular(16),
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                      image: ImageUtils.getAssetImage('/store/icon_zj'),
                      fit: BoxFit.cover)),
            ),
          ),
          Container(
            width: double.infinity,
            height: 10,
          ),
          Text(
            '店主手持身份证或营业执照',
            style: TextStyle(fontSize: 15, color: Colors.grey),
          )
        ],
      ),
    );
  }

  _selectImg() {}
}
