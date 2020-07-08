import 'package:deerflutter/widgets/app_bar.dart';
import 'package:deerflutter/widgets/load_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StoreAudioResultPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StoreAudioResultPageState();
  }
}

class _StoreAudioResultPageState extends State<StoreAudioResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: '审核结果',
        isBack: true,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: _buidBody(),
    );
  }

  _buidBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: double.infinity,
          height: 80,
        ),
        Image.asset(
          'assets/images/store/icon_success.png',
          width: 100,
          height: 100,
          fit: BoxFit.fill,
        ),
        Text(
          '恭喜店铺审核通过',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        Text(
          TimeOfDay.fromDateTime(DateTime.now()).format(context),
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
        Text(
          '五秒后进入主页',
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
        FlatButton(
            padding: EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 20),
            onPressed: () {},
            child: Container(
              height: 50,
              width: double.infinity,
              alignment: Alignment.center,
              color: Colors.blue,
              child: Text(
                '进入',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ))
      ],
    );
  }
}
