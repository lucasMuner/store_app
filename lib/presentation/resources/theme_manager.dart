import 'package:flutter/material.dart';
import 'package:flutter_advanced_app/presentation/resources/color_manager.dart';
import 'package:flutter_advanced_app/presentation/resources/font_manager.dart';
import 'package:flutter_advanced_app/presentation/resources/styles_manager.dart';
import 'package:flutter_advanced_app/presentation/resources/values_manager.dart';

ThemeData getApplicationTheme() {
  final colorScheme = ColorScheme.fromSwatch().copyWith(
    primary: ColorManager.primary,
    primaryContainer: ColorManager.primaryOpacity70,
    secondary: ColorManager
        .darkPrimary, // usei darkPrimary como exemplo para secondary
    background: ColorManager.white,
    surface: ColorManager.white,
    error: ColorManager.error,
    onPrimary: ColorManager.white,
    onSecondary: ColorManager.white,
    onSurface: ColorManager.grey,
    onBackground: ColorManager.grey,
    onError: ColorManager.white,
  );

  return ThemeData(
    //main colors of the app
    colorScheme: colorScheme,
    disabledColor: ColorManager.grey1,

    //ripple color
    splashColor: ColorManager.primaryOpacity70,

    //card view theme
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
    ),

    //App bar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.primary,
      elevation: AppSize.s4,
      shadowColor: ColorManager.primaryOpacity70,
      titleTextStyle: getRegularStyle(
        color: ColorManager.white,
        fontSize: FontSize.s16,
      ),
    ),

    //Button theme
    buttonTheme: ButtonThemeData(
        shape: StadiumBorder(),
        disabledColor: ColorManager.grey1,
        buttonColor: ColorManager.primary,
        splashColor: ColorManager.primaryOpacity70),

    //Elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(color: ColorManager.white),
        backgroundColor: ColorManager.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
      ),
    ),

    //Text theme
    textTheme: TextTheme(
        displayMedium: getSemiBoldStyle(
            color: ColorManager.darkGrey, fontSize: FontSize.s16),
        titleSmall: getMediumStyle(
            color: ColorManager.lightGrey, fontSize: FontSize.s14),
        labelLarge: getRegularStyle(color: ColorManager.grey1),
        bodyMedium: getRegularStyle(color: ColorManager.grey)
        //input decoration theme (text form field)
        ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(AppPadding.p8),

      //hint style
      hintStyle: getRegularStyle(color: ColorManager.grey1),

      //label style
      labelStyle: getMediumStyle(color: ColorManager.darkGrey),

      //error style
      errorStyle: getRegularStyle(color: ColorManager.error),

      //enable border
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
        borderRadius: BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
      ),

      //focused border
      focusedBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
        borderRadius: BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
      ),

      //error border
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.error, width: AppSize.s1_5),
        borderRadius: BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
      ),
    ),
  );
}
