import 'package:flutter/material.dart';
import 'package:sb_portal/utils/app_colors.dart';
import 'package:sb_portal/utils/app_font.dart';

class AppPopup extends StatefulWidget {
  String message;
  String okButtonName;
  String cancelButtonName;
  Function _onFirstCall;
  Function _onSecondCall;
  bool? positiveData;
  bool? negativeData;

  AppPopup(this.message, this.okButtonName, this.cancelButtonName, this._onFirstCall, this._onSecondCall, {this.positiveData, this.negativeData});

  State<StatefulWidget> createState() => AppPopupState();
}

class AppPopupState extends State<AppPopup> with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? scaleAnimation;
  BuildContext? _buildContext;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    scaleAnimation = CurvedAnimation(parent: controller!, curve: Curves.easeInOut);

    controller!.addListener(() {
      setState(() {});
    });

    controller!.forward();
  }

  @override
  Widget build(BuildContext context) {
    var labelName = Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Text(
        widget.message,
        style: AppFont.NUNITO_REGULAR_BLACK_14,
      ),
    );

    var acceptButton = Expanded(
      flex: 1,
      child: Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
        child: createMaterialButton(context, widget.okButtonName, () {
          widget._onSecondCall();
          if (widget.positiveData != null) {
            Navigator.of(context).pop(widget.positiveData);
          } else {
            Navigator.of(context).pop();
          }
        }, AppColors.colorLightBrown),
      ),
    );

    var rejectButton = Expanded(
      flex: 1,
      child: Container(
        alignment: Alignment.topRight,
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
        child: createMaterialButton(context, widget.cancelButtonName, () {
          widget._onFirstCall();
          if (widget.negativeData != null) {
            Navigator.of(context).pop(widget.negativeData);
          } else {
            Navigator.of(context).pop();
          }
        }, AppColors.colorBlue),
      ),
    );
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation!,
          child: Container(
            width: (MediaQuery.of(context).size.width / 100.0) * 80,
            decoration: ShapeDecoration(color: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0))),
            child: Padding(
              padding: const EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                //Text("Would you like to suggest another time?")
                children: <Widget>[
                  labelName,
                  Row(
                    children: <Widget>[
                      acceptButton,
                      rejectButton,
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  static Widget createMaterialButton(BuildContext context, String title, Function() onPressed, Color color,
      {double borderRadius = 12.0,
      String? preFixIcon,
      EdgeInsetsGeometry padding = const EdgeInsets.all(16.0),
      double elevation = 0,
      Color? iconColor,
      double iconWidth = 16,
      double iconHeight = 16,
      TextStyle textStyle = const TextStyle(color: Colors.white)}) {
    return Material(
        elevation: elevation,
        borderRadius: BorderRadius.circular(borderRadius),
        color: color,
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: MediaQuery.of(context).size.width,
          padding: padding,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              preFixIcon == null
                  ? Container()
                  : Image.asset(
                      preFixIcon,
                      color: iconColor,
                      width: iconWidth,
                      height: iconHeight,
                    ),
              preFixIcon == null
                  ? Container()
                  : const SizedBox(
                      width: 8,
                    ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: textStyle,
              ),
            ],
          ),
        ));
  }
}
