import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_dimens.dart';

class AppFont {
  static const ROBOT_REGULAR = TextStyle(
    fontFamily: 'RobotRegular',
    fontWeight: FontWeight.w400,
    height: 1.6,
    color: AppColors.colorBlack,
  );
  static const NUNITO_REGULAR = TextStyle(
    fontFamily: 'NunitoRegular',
    fontWeight: FontWeight.w400,
    height: 1.6,
    color: AppColors.colorBlack,
  );
  static const NUNITO_BOLD = TextStyle(
    fontFamily: 'NunitoBold',
    fontWeight: FontWeight.w400,
    height: 1.6,
    color: AppColors.colorBlack,
  );
  static const NUNITO_SEMI_BOLD = TextStyle(
    fontFamily: 'NunitoSemiBold',
    height: 1.6,
    color: AppColors.colorBlack,
  );

  static final NUNITO_SEMI_BOLD_BROWN_16 = NUNITO_SEMI_BOLD.copyWith(fontSize: Dimens.text_size_16, color: AppColors.colorBrown);

  static final NUNITO_SEMI_BOLD_COLOR_BROWN_24 = NUNITO_SEMI_BOLD.copyWith(fontSize: Dimens.text_size_24, color: AppColors.colorBrown);

  static final NUNITO_SEMI_BOLD_BLACK_16 = NUNITO_SEMI_BOLD.copyWith(fontSize: Dimens.text_size_16, color: AppColors.colorBlack);

  static final NUNITO_SEMI_BOLD_CHARCOAL_BLACK_14 = NUNITO_SEMI_BOLD.copyWith(fontSize: Dimens.text_size_14, color: AppColors.colorDarkCharcoal);

  static final NUNITO_SEMI_BOLD_CHARCOAL_BLACK_16 = NUNITO_SEMI_BOLD.copyWith(fontSize: Dimens.text_size_16, color: AppColors.colorDarkCharcoal);
  static final NUNITO_SEMI_BOLD_CHARCOAL_BLACK_18 = NUNITO_SEMI_BOLD.copyWith(fontSize: Dimens.text_size_18, color: AppColors.colorDarkCharcoal);
  static final NUNITO_SEMI_BOLD_CHARCOAL_BLACK_20 = NUNITO_SEMI_BOLD.copyWith(fontSize: Dimens.text_size_20, color: AppColors.colorDarkCharcoal);

  static final NUNITO_SEMI_BOLD_BLACK_20 = NUNITO_SEMI_BOLD.copyWith(fontSize: Dimens.text_size_20, color: AppColors.colorBlack);

  static final NUNITO_SEMI_BOLD_BROWN_14 = NUNITO_SEMI_BOLD.copyWith(fontSize: Dimens.text_size_14, color: AppColors.colorBrown);

  static final NUNITO_SEMI_BOLD_LIGHT_BROWN_14 = NUNITO_SEMI_BOLD.copyWith(fontSize: Dimens.text_size_14, color: AppColors.colorLightBrown);

  static final NUNITO_SEMI_BOLD_LIGHT_SILVER_14 = NUNITO_SEMI_BOLD.copyWith(fontSize: Dimens.text_size_14, color: AppColors.colorDarkSilver);

  static final NUNITO_SEMI_BOLD_BROWN_24 = NUNITO_SEMI_BOLD.copyWith(fontSize: Dimens.text_size_24, color: AppColors.colorLightBrown);
  static final NUNITO_SEMI_BOLD_BLACK_24 = NUNITO_SEMI_BOLD.copyWith(fontSize: Dimens.text_size_24, color: AppColors.colorBtnBlack);
  static final NUNITO_SEMI_BOLD_BLACK_NO_SIZE = NUNITO_SEMI_BOLD.copyWith(color: AppColors.colorBtnBlack);

  static final NUNITO_SEMI_BOLD_LIGHT_BROWN_16 = NUNITO_SEMI_BOLD.copyWith(fontSize: Dimens.text_size_16, color: AppColors.colorLightBrown);

  static final NUNITO_BOLD_WHITE_16 = NUNITO_SEMI_BOLD.copyWith(fontSize: Dimens.text_size_16, color: AppColors.colorWhite);
  static final NUNITO_BOLD_SILVER_24 = NUNITO_SEMI_BOLD.copyWith(fontSize: Dimens.text_size_24, color: AppColors.colorSilverPlan);
  static final NUNITO_BOLD_YELLOW_24 = NUNITO_SEMI_BOLD.copyWith(fontSize: Dimens.text_size_24, color: AppColors.colorYellow);
  static final NUNITO_BOLD_WHITE_24 = NUNITO_SEMI_BOLD.copyWith(fontSize: Dimens.text_size_16, color: AppColors.colorWhite);
  static final NUNITO_BOLD_WHITE_18 = NUNITO_SEMI_BOLD.copyWith(fontSize: Dimens.text_size_18, color: AppColors.colorWhite);

  static final NUNITO_BOLD_WHITE_12 = NUNITO_SEMI_BOLD.copyWith(fontSize: Dimens.text_size_12, color: AppColors.colorWhite);

  static final NUNITO_BOLD_LIGHT_BROWN_14 = NUNITO_SEMI_BOLD.copyWith(fontSize: Dimens.text_size_14, color: AppColors.colorLightBrown);

  static final NUNITO_BOLD_LIGHT_BROWN_16 = NUNITO_SEMI_BOLD.copyWith(fontSize: Dimens.text_size_16, color: AppColors.colorLightBrown);

  static final NUNITO_BOLD_BLACK_16 = NUNITO_SEMI_BOLD.copyWith(fontSize: Dimens.text_size_16, color: AppColors.colorBlack);

  static final NUNITO_BOLD_DARK_CHARCOALBLACK_16 = NUNITO_SEMI_BOLD.copyWith(fontSize: Dimens.text_size_16, color: AppColors.colorDarkCharcoal);

  static final NUNITO_BOLD_DARK_CHARCOALBLACK_20 = NUNITO_SEMI_BOLD.copyWith(fontSize: Dimens.text_size_20, color: AppColors.colorDarkCharcoal);

  static final NUNITO_BOLD_DARK_CHARCOALBLACK_18 = NUNITO_SEMI_BOLD.copyWith(fontSize: Dimens.text_size_20, color: AppColors.color016299);

  static final NUNITO_BOLD_DARK_CHARCOALBLACK_22 =
      NUNITO_SEMI_BOLD.copyWith(fontSize: Dimens.text_size_22, color: AppColors.color1122, fontWeight: FontWeight.w900, fontStyle: FontStyle.normal);

  static final NUNITO_BOLD_DARK_CHARCOALBLACK_26 =
      NUNITO_SEMI_BOLD.copyWith(fontSize: Dimens.text_size_26, color: AppColors.color1122, fontWeight: FontWeight.w900, fontStyle: FontStyle.normal);

  static final NUNITO_REGULAR_BLACK_18 = NUNITO_SEMI_BOLD.copyWith(fontSize: Dimens.text_size_18, color: AppColors.colorDarkCharcoal);

  static final NUNITO_REGULAR_BLACK_14 = NUNITO_REGULAR.copyWith(fontSize: Dimens.text_size_14, color: AppColors.colorDarkCharcoal);

  static final NUNITO_REGULAR_DARK_CHARCOAl_BLACK_16 = NUNITO_REGULAR.copyWith(fontSize: Dimens.text_size_16, color: AppColors.colorDarkCharcoal);

  static final NUNITO_REGULAR_DARK_CHARCOAl_BLACK_14 = NUNITO_REGULAR.copyWith(fontSize: Dimens.text_size_14, color: AppColors.colorDarkCharcoal);

  static final NUNITO_REGULAR_DARK_BLACK_14 = NUNITO_REGULAR.copyWith(fontSize: Dimens.text_size_14, color: AppColors.colorDarkBlack);
  static final NUNITO_REGULAR_DARK_BLACK_16 = NUNITO_REGULAR.copyWith(fontSize: Dimens.text_size_16, color: AppColors.colorDarkBlack);

  static final NUNITO_REGULAR_LIGHT_BROWN_12 = NUNITO_REGULAR.copyWith(fontSize: Dimens.text_size_12, color: AppColors.colorLightBrown);
  static final NUNITO_REGULAR_LIGHT_BROWN_16 = NUNITO_REGULAR.copyWith(fontSize: Dimens.text_size_16, color: AppColors.colorLightBrown);

  static final NUNITO_REGULAR_LIGHT_BROWN_14 = NUNITO_REGULAR.copyWith(fontSize: Dimens.text_size_14, color: AppColors.colorLightBrown);

  static final NUNITO_REGULAR_WHITE_12 = NUNITO_REGULAR.copyWith(fontSize: Dimens.text_size_12, color: AppColors.colorWhite);
  static final NUNITO_REGULAR_WHITE_10 = NUNITO_REGULAR.copyWith(fontSize: Dimens.text_size_8, color: AppColors.colorWhite);
  static final NUNITO_REGULAR_WHITE_16 = NUNITO_REGULAR.copyWith(fontSize: Dimens.text_size_16, color: AppColors.colorWhite);
  static final NUNITO_REGULAR_WHITE_BOLD_16 =
      NUNITO_REGULAR.copyWith(fontSize: Dimens.text_size_16, color: AppColors.colorWhite, fontWeight: FontWeight.w500);

  static final NUNITO_REGULAR_COLOR_RADIO_16 = NUNITO_REGULAR.copyWith(fontSize: Dimens.text_size_16, color: AppColors.colorRadio);

  static final NUNITO_REGULAR_BLACK_20 = NUNITO_REGULAR.copyWith(fontSize: Dimens.text_size_20, color: AppColors.colorDarkCharcoal);

  static final NUNITO_REGULAR_BLACK_10 = NUNITO_REGULAR.copyWith(fontSize: Dimens.text_size_10, color: AppColors.colorDarkCharcoal);

  static final NUNITO_REGULAR_DARK_GREYISH_16 = NUNITO_SEMI_BOLD.copyWith(fontSize: Dimens.text_size_16, color: AppColors.colorDarkGreyishPal);

  static final NUNITO_REGULAR_LIGHT_SILVER_16 = NUNITO_SEMI_BOLD.copyWith(fontSize: Dimens.text_size_16, color: AppColors.colorDarkSilver);

  static final NUNITO_REGULAR_LIGHT_SLIVER_14 = NUNITO_REGULAR.copyWith(fontSize: Dimens.text_size_14, color: AppColors.colorDarkSilver);

  static final NUNITO_REGULAR_LIGHT_SLIVER_12 = NUNITO_REGULAR.copyWith(fontSize: Dimens.text_size_12, color: AppColors.colorDarkSilver);

  static final NUNITO_REGULAR_SILVER_14 = NUNITO_SEMI_BOLD.copyWith(fontSize: Dimens.text_size_14, color: AppColors.colorDarkSilver);

  //=======================================================
  static final ROBOT_REGULAR_BLACK_14 = ROBOT_REGULAR.copyWith(fontSize: Dimens.text_size_14, color: AppColors.colorGreyRobot);
}
