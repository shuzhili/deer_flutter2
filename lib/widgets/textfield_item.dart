import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldItem extends StatelessWidget {
  TextEditingController controller = new TextEditingController();

  TextFieldItem({Key key, this.title, this.hitStr}) : super(key: key);
  String title;
  String hitStr;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 10),
          child: Text(
            title,
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
              controller: controller,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  hintText: hitStr,
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1),
                  )),
            )),
      ],
    );
  }
}
