import 'package:deerflutter/application.dart';
import 'package:deerflutter/widgets/app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_2d_amap/flutter_2d_amap.dart';

class AddressSelectPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AddressSelectPageState();
}

class AddressSelectPageState extends State<AddressSelectPage> {
  AMap2DController aMap2DController;
  List<PoiSearch> _list = [];
  int _index = 0;

  ScrollController scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        onPressed: () {
          Application.router.pop(context);
        },
        title: '搜索',
      ),
      body: Column(
        children: [
          Expanded(
            flex: 9,
            child: AMap2DView(
              onPoiSearched: (result) {
                _index = 0;
                _list = result;
                setState(() {});
              },
              onAMap2DViewCreated: (controller) {
                aMap2DController = controller;
              },
            ),
          ),
          Expanded(
            flex: 11,
            child: ListView.separated(
                controller: scrollController,
                itemBuilder: (_, index) {
                  return InkWell(
                    onTap: () {
                      _index = index;
                      if (aMap2DController != null) {
                        aMap2DController.move(
                            _list[index].latitude, _list[index].longitude);
                      }
                      setState(() {});
                    },
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      height: 50.0,
                      child: Row(
                        children: [
                          Expanded(
                              child: Text(_list[index].provinceName +
                                  ' ' +
                                  _list[index].cityName +
                                  ' ' +
                                  _list[index].adName +
                                  ' ' +
                                  _list[index].title)),
                          Opacity(
                            opacity: _index == index ? 1 : 0,
                            child: Icon(
                              Icons.done,
                              color: Colors.blue,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (_, index) {
                  return const Divider();
                },
                itemCount: _list.length),
          ),
          FlatButton(
            onPressed: () {
              Navigator.pop(context, _list[_index]);
            },
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(16),
              height: 50,
              width: double.infinity,
              color: Colors.blue,
              child: Text(
                '确认',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          )
        ],
      ),
    );
  }
}
