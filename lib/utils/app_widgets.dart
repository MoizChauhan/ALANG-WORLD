import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sb_portal/utils/app_string.dart';

import 'app_colors.dart';
import 'app_dimens.dart';
import 'app_font.dart';

class AppWidgets {
  static buildInputFields(
      TextEditingController _controller,
      String name,
      bool isPass,
      FocusNode focusNode,
      FocusNode? nextFocusNode,
      BuildContext context,
      {textInputAction = TextInputAction.done,
      EdgeInsets scrollPadding = const EdgeInsets.only(bottom: 40.0),
      bool isEnable = true,
      TextStyle? textStyle,
      bool isEmailField = false}) {
    return TextFormField(
      controller: _controller,
      textInputAction: textInputAction,
      scrollPadding: scrollPadding,
      style: AppFont.NUNITO_REGULAR_DARK_CHARCOAl_BLACK_16,
      keyboardType: isPass
          ? TextInputType.visiblePassword
          : isEmailField
              ? TextInputType.emailAddress
              : TextInputType.text,
      obscureText: isPass,
      enabled: isEnable,
      focusNode: focusNode,
      onFieldSubmitted: (term) {
        focusNode.unfocus();
        FocusScope.of(context).requestFocus(nextFocusNode);
      },
      decoration: InputDecoration(
        isDense: true,
        hintText: name,
        hintStyle: AppFont.NUNITO_REGULAR_DARK_CHARCOAl_BLACK_16,
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
    );
  }

  static buildPasswordInputFields(
      TextEditingController _controller,
      String name,
      bool isPass,
      FocusNode focusNode,
      FocusNode? nextFocusNode,
      BuildContext context,
      {textInputAction = TextInputAction.done,
      EdgeInsets scrollPadding = const EdgeInsets.only(bottom: 40.0),
      bool isEnable = true,
      TextStyle? textStyle,
      bool isEmailField = false,
      Function()? onPressedPass}) {
    return TextFormField(
      controller: _controller,
      textInputAction: textInputAction,
      scrollPadding: scrollPadding,
      style: AppFont.NUNITO_REGULAR_DARK_CHARCOAl_BLACK_16,
      keyboardType: isPass
          ? TextInputType.visiblePassword
          : isEmailField
              ? TextInputType.emailAddress
              : TextInputType.text,
      obscureText: isPass,
      enabled: isEnable,
      focusNode: focusNode,
      onFieldSubmitted: (term) {
        focusNode.unfocus();
        FocusScope.of(context).requestFocus(nextFocusNode);
      },
      decoration: InputDecoration(
        isDense: true,
        hintText: name,
        hintStyle: AppFont.NUNITO_REGULAR_DARK_CHARCOAl_BLACK_16,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        suffixIcon: IconButton(
          icon: Icon(
            !isPass ? Icons.visibility : Icons.visibility_off,
            color: Theme.of(context).primaryColorDark,
          ),
          onPressed: onPressedPass,
        ),
      ),
    );
  }

  static buildInputFieldsWithNumber(
      TextEditingController _controller,
      String name,
      bool isPass,
      FocusNode focusNode,
      FocusNode? nextFocusNode,
      BuildContext context,
      {textInputAction = TextInputAction.done,
      EdgeInsets scrollPadding = const EdgeInsets.only(bottom: 40.0),
      bool isEnable = true,
      TextStyle? textStyle}) {
    return TextFormField(
      controller: _controller,
      textInputAction: textInputAction,
      scrollPadding: scrollPadding,
      style: AppFont.NUNITO_REGULAR_BLACK_14,
      keyboardType:
          isPass ? TextInputType.visiblePassword : TextInputType.number,
      obscureText: isPass,
      enabled: isEnable,
      maxLength: 6,
      focusNode: focusNode,
      onFieldSubmitted: (term) {
        focusNode.unfocus();
        FocusScope.of(context).requestFocus(nextFocusNode);
      },
      decoration: InputDecoration(
          isDense: true,
          hintText: name,
          counterText: '',
          hintStyle: AppFont.NUNITO_REGULAR_BLACK_14,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          border: InputBorder.none),
    );
  }

  static buildInputFieldsWithDate(
      TextEditingController _controller,
      String name,
      bool isPass,
      FocusNode focusNode,
      FocusNode? nextFocusNode,
      BuildContext context,
      {textInputAction = TextInputAction.done,
      EdgeInsets scrollPadding = const EdgeInsets.only(bottom: 40.0),
      bool isEnable = true,
      TextStyle? textStyle}) {
    return TextFormField(
      controller: _controller,
      textInputAction: textInputAction,
      scrollPadding: scrollPadding,
      style: AppFont.NUNITO_REGULAR_BLACK_14,
      inputFormatters: [
        
      ],
      keyboardType:
          isPass ? TextInputType.visiblePassword : TextInputType.number,
      obscureText: isPass,
      enabled: isEnable,
      maxLength: 6,
      focusNode: focusNode,
      onFieldSubmitted: (term) {
        focusNode.unfocus();
        FocusScope.of(context).requestFocus(nextFocusNode);
      },
      decoration: InputDecoration(
          isDense: true,
          hintText: name,
          counterText: '',
          hintStyle: AppFont.NUNITO_REGULAR_BLACK_14,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          border: InputBorder.none),
    );
  }

  static buildInputFieldsForUrl(
      TextEditingController _controller,
      String name,
      bool isPass,
      FocusNode focusNode,
      FocusNode? nextFocusNode,
      BuildContext context,
      {textInputAction = TextInputAction.done,
      EdgeInsets scrollPadding = const EdgeInsets.only(bottom: 40.0),
      bool isEnable = true,
      TextStyle? textStyle}) {
    return TextFormField(
      controller: _controller,
      textInputAction: textInputAction,
      scrollPadding: scrollPadding,
      style: AppFont.NUNITO_REGULAR_BLACK_14,
      keyboardType: isPass ? TextInputType.visiblePassword : TextInputType.text,
      textCapitalization: TextCapitalization.none,
      obscureText: isPass,
      enabled: isEnable,
      focusNode: focusNode,
      onFieldSubmitted: (term) {
        focusNode.unfocus();
        FocusScope.of(context).requestFocus(nextFocusNode);
      },
      decoration: InputDecoration(
        isDense: true,
        hintText: name,
        hintStyle: AppFont.NUNITO_REGULAR_SILVER_14,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.colorBorder, width: 1.0),
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.colorBorder, width: 1.0),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.colorBorder, width: 1.0),
        ),
      ),
    );
  }

  static buildInputFieldsForNamePopup(
      TextEditingController _controller,
      String name,
      bool isPass,
      FocusNode focusNode,
      FocusNode? nextFocusNode,
      BuildContext context,
      {textInputAction = TextInputAction.done,
      EdgeInsets scrollPadding = const EdgeInsets.only(bottom: 50.0),
      bool isEnable = true,
      TextStyle? textStyle}) {
    return TextFormField(
      controller: _controller,
      autofocus: true,
      textInputAction: textInputAction,
      scrollPadding: scrollPadding,
      style: AppFont.NUNITO_REGULAR_BLACK_14,
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.sentences,
      obscureText: isPass,
      enabled: isEnable,
      focusNode: focusNode,
      onFieldSubmitted: (term) {
        focusNode.unfocus();
        FocusScope.of(context).requestFocus(nextFocusNode);
      },
      maxLength: 100,
      decoration: InputDecoration(
        isDense: true,
        hintText: name,
        counterText: "",
        hintStyle: AppFont.NUNITO_REGULAR_SILVER_14,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.colorBorder, width: 1.0),
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.colorBorder, width: 1.0),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.colorBorder, width: 1.0),
        ),
      ),
    );
  }

  static buildInputFieldsForName(
      TextEditingController _controller,
      String name,
      bool isPass,
      FocusNode focusNode,
      FocusNode? nextFocusNode,
      BuildContext context,
      {textInputAction = TextInputAction.done,
      EdgeInsets scrollPadding = const EdgeInsets.only(bottom: 40.0),
      bool isEnable = true,
      TextStyle? textStyle}) {
    return TextFormField(
      controller: _controller,
      textInputAction: textInputAction,
      scrollPadding: scrollPadding,
      style: AppFont.NUNITO_REGULAR_BLACK_14,
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.sentences,
      obscureText: isPass,
      enabled: isEnable,
      focusNode: focusNode,
      onFieldSubmitted: (term) {
        focusNode.unfocus();
        FocusScope.of(context).requestFocus(nextFocusNode);
      },
      maxLength: 100,
      decoration: InputDecoration(
        isDense: true,
        hintText: name,
        counterText: "",
        hintStyle: AppFont.NUNITO_REGULAR_SILVER_14,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.colorBorder, width: 1.0),
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.colorBorder, width: 1.0),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.colorBorder, width: 1.0),
        ),
      ),
    );
  }

  static buildInputFieldsForNameWithError(
      TextEditingController _controller, String name,
      {Function(String)? onValidator,
      Function(String)? onChanged,
      Function(String)? onSaved,
      textInputAction = TextInputAction.done,
      EdgeInsets scrollPadding = const EdgeInsets.only(bottom: 40.0),
      bool isEnable = true,
      TextStyle? textStyle}) {
    return TextFormField(
      controller: _controller,
      textInputAction: textInputAction,
      scrollPadding: scrollPadding,
      style: AppFont.NUNITO_REGULAR_BLACK_14,
      keyboardType: TextInputType.name,
      textCapitalization: TextCapitalization.sentences,
      enabled: isEnable,
      validator: (input) {
        onValidator!(input!);
        return null;
      },
      onChanged: (value) {
        onChanged!(value);
      },
      onSaved: (val) {
        onSaved!(val!);
      },
      decoration: InputDecoration(
        isDense: true,
        hintText: name,
        hintStyle: AppFont.NUNITO_REGULAR_SILVER_14,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.colorBorder, width: 1.0),
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.colorBorder, width: 1.0),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.colorBorder, width: 1.0),
        ),
      ),
    );
  }

  static Widget buildSimpleButton({
    String? btnTitle,
    Function()? onButtonTapAction,
    TextStyle? textStyle,
    double? btnWidth,
    double? btnHeight = 44,
  }) {
    return GestureDetector(
      child: Material(
        elevation: 0.0,
        borderRadius: BorderRadius.circular(24),
        color: AppColors.colorLightBrown,
        child: Container(
          alignment: Alignment.center,
          width: btnWidth,
          height: btnHeight,
          child: MaterialButton(
              onPressed: null, child: Text(btnTitle!, style: textStyle)),
        ),
      ),
      onTap: onButtonTapAction,
    );
  }

  static Widget buildSimpleButtonWithBorder(
      {String? btnTitle,
      Function()? onButtonTapAction,
      TextStyle? textStyle,
      double? btnWidth,
      Color bgColor = AppColors.colorWhiteTwo,
      Color bgbBorderColor = AppColors.colorLightBrown,
      double? btnHeight = 36}) {
    return GestureDetector(
      child: Material(
        elevation: 0.0,
        borderRadius: BorderRadius.circular(24),
        color: AppColors.colorWhite,
        child: Container(
          alignment: Alignment.center,
          width: btnWidth,
          height: btnHeight,
          decoration: BoxDecoration(
            color: bgColor,
            border: Border.all(color: bgbBorderColor),
            borderRadius:
                const BorderRadius.all(Radius.circular(Dimens.margin24)),
          ),
          child: MaterialButton(
              onPressed: null, child: Text(btnTitle!, style: textStyle)),
        ),
      ),
      onTap: onButtonTapAction,
    );
  }

  static void showConfirmationDialog(
    BuildContext context,
    String message,
    double? height, {
    String actionLabelOne = APPStrings.YES,
    String actionLabelTwo = APPStrings.NO,
    Function()? onClickActionOne,
    Function()? onClickActionTwo,
  }) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return Align(
            child: Material(
              borderRadius:
                  const BorderRadius.all(Radius.circular(Dimens.margin12)),
              child: Container(
                  height: height,
                  padding: const EdgeInsets.symmetric(
                      horizontal: Dimens.margin16, vertical: Dimens.margin24),
                  width: (MediaQuery.of(context).size.width / 100.0) * 84,
                  child: Column(
                    children: [
                      Text(
                        message,
                        style: AppFont.NUNITO_REGULAR_DARK_CHARCOAl_BLACK_16,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: Dimens.margin16),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              AppWidgets.createMaterialButton(
                                context,
                                actionLabelOne,
                                onClickActionOne!,
                                bgColor: AppColors.colorWhite,
                                borderRadius: 22,
                                textStyle: AppFont.NUNITO_BOLD_BLACK_16,
                              ),
                            ],
                          ),
                          const SizedBox(width: Dimens.margin8),
                          Column(
                            children: [
                              AppWidgets.createMaterialButton(
                                context,
                                actionLabelTwo,
                                onClickActionTwo!,
                                bgColor: AppColors.colorBlack,
                                borderRadius: 22,
                                textStyle: AppFont.NUNITO_BOLD_WHITE_16,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
          );
        });
  }

  static Widget createMaterialButton(
      BuildContext context, String title, Function() onPressed,
      {double borderRadius = 16.0, TextStyle? textStyle, Color? bgColor}) {
    return GestureDetector(
      child: Material(
        elevation: 0.0,
        borderRadius: BorderRadius.circular(borderRadius),
        color: bgColor,
        child: Container(
          alignment: Alignment.center,
          width: 130,
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.colorBlack),
            borderRadius:
                const BorderRadius.all(Radius.circular(Dimens.margin24)),
          ),
          child: MaterialButton(
            onPressed: null,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: textStyle,
            ),
          ),
        ),
      ),
      onTap: onPressed,
    );
  }

  static buildCommentInputFields(
      TextEditingController _controller,
      String name,
      bool isPass,
      FocusNode focusNode,
      FocusNode? nextFocusNode,
      BuildContext context,
      {textInputAction = TextInputAction.done,
      EdgeInsets scrollPadding = const EdgeInsets.only(bottom: 40.0),
      bool isEnable = true,
      TextStyle? textStyle}) {
    return TextFormField(
      expands: false,
      maxLines: 3,
      controller: _controller,
      textInputAction: textInputAction,
      scrollPadding: scrollPadding,
      textCapitalization: TextCapitalization.sentences,
      style: textStyle ?? AppFont.NUNITO_REGULAR_DARK_BLACK_16,
      keyboardType: isPass ? TextInputType.visiblePassword : TextInputType.text,
      obscureText: isPass,
      enabled: isEnable,
      focusNode: focusNode,
      onFieldSubmitted: (term) {
        focusNode.unfocus();
        FocusScope.of(context).requestFocus(nextFocusNode);
      },
      decoration: InputDecoration(
        isDense: true,
        hintText: name,
        hintStyle: AppFont.NUNITO_REGULAR_DARK_BLACK_16,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.colorBorder, width: 1.0),
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.colorBorder, width: 1.0),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.colorBorder, width: 1.0),
        ),
      ),
    );
  }

  static String format(String text) {
    return text.replaceAll("-", "/");
  }

  static convertServerDate(String date) {
    DateTime newDate = DateFormat("yyyy/MM/dd").parse(format(date));
    return (newDate.day.toString() +
        "-" +
        newDate.month.toString() +
        "-" +
        newDate.year.toString());
  }

  static convertDate(String date) {
    DateTime newDate = DateFormat("dd/MM/yyyy").parse(format(date));
    return (newDate.year.toString() +
        "-" +
        newDate.month.toString() +
        "-" +
        newDate.day.toString());
  }

  static convertDateForAddEvent(String date) {
    DateTime newDate = DateFormat("yyyy-MM-dd HH:mm").parse(date);
    String formatDate(DateTime date) =>
        DateFormat("yyyy-MM-dd hh:mm").format(date);
    return formatDate(newDate);
  }

  static convertDateEditEvent(String date) {
    DateTime newDate = DateFormat("dd-MM-yyyy").parse(date);
    String formatDate(DateTime date) => DateFormat("yyyy-MM-dd").format(date);
    return formatDate(newDate);
  }

  static convertEventDate(String date) {
    DateTime newDate = DateFormat("dd/MM/yyyy").parse(format(date));
    String formatDate(DateTime date) => DateFormat("yyyy-MM-dd").format(date);
    return formatDate(newDate.add(const Duration(days: 1)));
  }

  static convertDateToUsFormat(String date) {
    DateTime newDate = DateFormat("yyyy/MM/dd").parse(format(date));
    String formatDate(DateTime date) => DateFormat.yMMMd().format(date);
    return formatDate(newDate);
  }

  static convertDateToUsFor(String date) {
    DateTime newDate = DateFormat("dd/MM/yyyy").parse(format(date));
    String formatDate(DateTime date) => DateFormat.yMMMd().format(date);
    return formatDate(newDate);
  }

  static Widget circleAvatar(String imageUrl, {double radius = 16.0}) {
    return CircleAvatar(
        backgroundImage: NetworkImage(imageUrl), radius: radius);
  }

  static String utf8convert(String text) {
    List<int> bytes = text.toString().codeUnits;
    return utf8.decode(bytes);
  }
}
