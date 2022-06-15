import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sb_portal/utils/app_font.dart';
import 'package:sb_portal/utils/app_string.dart';

class ShowDialog {
  static ShowDialog _instance = ShowDialog.internal();

  ShowDialog.internal();

  factory ShowDialog() => _instance;

  static void showCustomDialog(BuildContext context, String msg, String btn,
      {VoidCallback? okBtnFunction}) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => Platform.isIOS
            ? CupertinoAlertDialog(
                content: Text(msg),
                actions: [
                  CupertinoDialogAction(
                      onPressed: () {
                        if (okBtnFunction != null) {
                          okBtnFunction();
                        } else {
                          Navigator.pop(context);
                        }
                      },
                      isDefaultAction: true,
                      child: Text(
                        btn.isNotEmpty ? btn : APPStrings.OK,
                        style: AppFont.NUNITO_SEMI_BOLD_BLACK_16,
                      ))
                ],
              )
            : AlertDialog(
                content: Text(msg, textAlign: TextAlign.center),
                actions: [
                    FlatButton(
                        onPressed: () {
                          if (okBtnFunction != null) {
                            okBtnFunction();
                          } else {
                            Navigator.pop(context);
                          }
                        },
                        child: Text(btn.isNotEmpty ? btn : APPStrings.OK))
                  ]));
  }

  static void showCustomDialogClick(
      BuildContext context, String msg, String btn,
      {VoidCallback? okBtnFunction}) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => Platform.isIOS
            ? CupertinoAlertDialog(
                content: Text(msg),
                actions: [
                  CupertinoDialogAction(
                      onPressed: () {
                        okBtnFunction!();
                      },
                      isDefaultAction: true,
                      child: Text(btn.isNotEmpty ? btn : APPStrings.OK))
                ],
              )
            : AlertDialog(
                content: Text(msg),
                actions: [
                  FlatButton(
                      onPressed: () {
                        okBtnFunction!();
                      },
                      child: Text(btn.isNotEmpty ? btn : APPStrings.OK))
                ],
              ));
  }
}
