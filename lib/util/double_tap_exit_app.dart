import 'package:deerflutter/util/toast.dart';
import 'package:flutter/cupertino.dart';

class DoubleTapBackExitApp extends StatefulWidget {
  DoubleTapBackExitApp({
    Key key,
    @required this.child,
    this.duration: const Duration(milliseconds: 2500),
  }) : super(key: key);
  Widget child;
  Duration duration;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DoubleTapBackExitAppState();
  }
}

class DoubleTapBackExitAppState extends State<DoubleTapBackExitApp> {
  DateTime _lastTime;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: widget.child, onWillPop: _isExit);
  }

  Future<bool> _isExit() {
    if (_lastTime == null ||
        DateTime.now().difference(_lastTime) > widget.duration) {
      _lastTime = DateTime.now();
      Toast.show('再次点击退出应用');
      return Future.value(false);
    }
    Toast.cancelToast();
    return Future.value(true);
  }
}
