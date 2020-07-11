import 'package:deerflutter/res/dimens.dart';
import 'package:deerflutter/res/gaps.dart';
import 'package:deerflutter/util/theme_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseDialog extends StatelessWidget {
  final String title;
  final Function onPressed;
  final Widget child;
  final bool hiddenTitle;

  BaseDialog({Key key,
    this.title,
    this.onPressed,
    this.hiddenTitle: false,
    @required this.child})
      : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: AnimatedContainer(
        alignment: Alignment.center,
        height: MediaQuery
            .of(context)
            .size
            .height -
            MediaQuery
                .of(context)
                .viewInsets
                .bottom,
        duration: Duration(milliseconds: 120),
        curve: Curves.easeInCubic,
        child: Container(
          decoration: BoxDecoration(
            color: ThemeUtils.getBackgroundColor(context),
            borderRadius: BorderRadius.circular(5.0),
          ),
          width: 270,
          padding: EdgeInsets.only(top: 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Offstage(
                offstage: hiddenTitle,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Flexible(
                child: child,
              ),
              Gaps.line,
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 48.0,
                      child: FlatButton(
                        child: const Text(
                          '取消',
                          style: TextStyle(fontSize: Dimens.font_sp18),
                        ),
                        textColor: Colors.grey,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 48.0,
                    width: 0.6,
                    child: const VerticalDivider(),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 48.0,
                      child: FlatButton(
                        child: const Text(
                          '确定',
                          style: TextStyle(fontSize: Dimens.font_sp18),
                        ),
                        textColor: Theme
                            .of(context)
                            .primaryColor,
                        onPressed: () {
                          onPressed();
                        },
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
