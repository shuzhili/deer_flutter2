import 'package:deerflutter/util/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar(
      {Key key,
      this.backgroundColor,
      this.title: '',
      this.centerTitle: '',
      this.actionName: '',
      this.backImg: 'assets/images/ic_back_black.png',
      this.onPressed,
      this.isBack: true})
      : super(key: key);

  final Color backgroundColor;
  final String title;
  final String centerTitle;
  final String actionName;
  final String backImg;
  final VoidCallback onPressed;
  final bool isBack;

  @override
  Widget build(BuildContext context) {
    Color _backgroundColor;

    if (_backgroundColor == null) {
      _backgroundColor = ThemeUtils.getBackgroundColor(context);
    } else {
      _backgroundColor = backgroundColor;
    }

    SystemUiOverlayStyle _overlayStyle = SystemUiOverlayStyle.light;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: _overlayStyle,
      child: Material(
        child: SafeArea(
            child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Semantics(
              namesRoute: true,
              header: true,
              child: Container(
                alignment: centerTitle.isEmpty
                    ? Alignment.centerLeft
                    : Alignment.center,
                width: double.infinity,
                child: Text(
                  title.isEmpty ? centerTitle : title,
                  style: TextStyle(fontSize: 18),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 48.0),
              ),
            ),
            isBack
                ? IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      Navigator.maybePop(context);
                    },
                    tooltip: 'back',
                    padding: EdgeInsets.all(12.0),
                  )
                : Positioned(
                    right: 0.0,
                    child: actionName.isEmpty
                        ? Container()
                        : FlatButton(
                            onPressed: onPressed,
                            child: Text(actionName,
                                key: const Key('actionName')))),
          ],
        )),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(48);
}
