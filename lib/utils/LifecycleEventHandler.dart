import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class LifecycleEventHandler extends WidgetsBindingObserver {
  LifecycleEventHandler({this.resumeCallBack, this.suspendingCallBack, this.pausedCallBack, this.inactiveCallBack});

  final AsyncCallback? pausedCallBack;
  final AsyncCallback? inactiveCallBack;
  final AsyncCallback? resumeCallBack;
  final AsyncCallback? suspendingCallBack;

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.inactive:
        // debugPrint("LifecycleEventHandler notResume");
        if (inactiveCallBack != null) await inactiveCallBack!();
        break;
      case AppLifecycleState.paused:
        // debugPrint("LifecycleEventHandler paused");
        if (pausedCallBack != null) await pausedCallBack!();
        break;
      case AppLifecycleState.detached:
        // debugPrint("LifecycleEventHandler detached");
        if (suspendingCallBack != null) await suspendingCallBack!();
        break;
      case AppLifecycleState.resumed:
        // debugPrint(" LifecycleEventHandler resumed");
        if (resumeCallBack != null) await resumeCallBack!();
        break;
    }
  }
}
