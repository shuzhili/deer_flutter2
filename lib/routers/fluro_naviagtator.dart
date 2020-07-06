import 'package:deerflutter/application.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';

class NavigatorUtils {
  static push(BuildContext context, String path,
      {bool replace = false, bool clearStack = false}) {
    FocusScope.of(context).unfocus();
    Application.router.navigateTo(context, path,
        replace: replace,
        clearStack: clearStack,
        transition: TransitionType.native);
  }
}
