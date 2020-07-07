import 'dart:io';

import 'package:deerflutter/util/image_utils.dart';
import 'package:deerflutter/util/toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SelectImage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SelectImageState();
  }
}

class _SelectImageState extends State<SelectImage> {
  File _imgFile;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return buildSelectImg();
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
                      image: _imgFile == null
                          ? ImageUtils.getAssetImage('store/icon_zj')
                          : FileImage(_imgFile),
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

  _selectImg() async {
    try {
      _imgFile = await ImagePicker.pickImage(
          source: ImageSource.gallery, maxWidth: 800, imageQuality: 95);
      setState(() {});
    } catch (e) {
      Toast.show("打开失败");
    }
  }
}
