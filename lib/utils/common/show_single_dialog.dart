import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class DialogSingleClick {
  static final DialogSingleClick _instance = DialogSingleClick.internal();

  DialogSingleClick.internal();

  factory DialogSingleClick() => _instance;

  static void showCustomDialog(BuildContext context,
      {@required String? title,
        String? okBtnText,
        String? cancelBtnText,
        @required VoidCallback? okBtnFunction}) {
    showDialog(
        context: context,
        builder: (BuildContext context) =>
        Platform.isIOS? CupertinoAlertDialog(
          content: Text(title!),
          actions: [
            CupertinoDialogAction(
                onPressed: () {
                  Navigator.pop(context);
                },
                isDefaultAction: true,
                child: Text(cancelBtnText!)),
            CupertinoDialogAction(
                onPressed:(){
                  okBtnFunction!();
                },
                isDefaultAction: true,
                child: Text(okBtnText!))
          ],
        ): AlertDialog(
          content: Text(title!),
          actions: <Widget>[
            FlatButton(
              onPressed: (){
                Navigator.pop(context);
              },
                child: Text(cancelBtnText!)
            ),
            FlatButton(
                onPressed: (){
                  okBtnFunction!();
                },
                child: Text(okBtnText!)
            )
          ],
        ));
  }
}
