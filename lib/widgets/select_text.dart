import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectText extends StatefulWidget {
  SelectText({Key key, @required this.title, this.hitText: '', this.onTap})
      : super(key: key);
  String title;
  String hitText;
  GestureTapCallback onTap;

  @override
  State<StatefulWidget> createState() => SelectTextState();
}

class SelectTextState extends State<SelectText> {
  TextEditingController controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: 50,
        width: double.infinity,
        margin: const EdgeInsets.only(right: 8.0),
        decoration: BoxDecoration(
            border: Border(
          bottom: Divider.createBorderSide(context, width: 0.6),
        )),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Text(widget.title,style: TextStyle(fontSize: 20),),
            ),

            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Text(
                  widget.hitText,
                  maxLines: 2,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Icon(Icons.arrow_right),
          ],
        ),
      ),
    );
  }
}
