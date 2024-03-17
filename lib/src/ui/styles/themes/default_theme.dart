import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/src/infrastructure/infrastructure.dart';
import 'package:weather_app/src/ui/ui.dart';

class DefaultThemeColors extends IAppColors {
  @override
  Color get accent => const Color(0xff82868B);
  @override
  Color get accentPale => const Color(0xffD63384);
  @override
  Color get canvas => const Color(0xffFFFFFF);
  @override
  Color get canvasDark => const Color(0xffDADADA);
  @override
  Color get disabled => const Color(0xffEFEFEF);
  @override
  Color get divider => const Color(0xffEBE9F1);
  @override
  Color get success => const Color(0xff28C76F);
  @override
  Color get error => const Color(0xffEF530F);
  @override
  Color get warning => const Color(0xffF2A744);
  @override
  Color get info => const Color(0xff00CFE8);
  @override
  Color get primary => primaryPale; //Eklendi
  @override
  Color get primaryPale => Color.fromARGB(255, 68, 164, 242);
  @override
  Color get unselectedWidgetColor => mutedPlaceholderText;
  @override
  Color get toggleableActiveColor => primary;
  @override
  Color get inputFillColor => canvas;
  @override
  Color get border => const Color(0xffD8D6DE);

  //Inkwell
  @override
  Color get splash => accent.lighten(0.8);
  @override
  Color get highlight => accent.lighten(0.7);

  @override
  Color get canvasDarkPale => const Color(0xff4B4B4B);

  @override
  Color get canvasPrimaryPale => const Color(0xffF8F8F8);

  @override
  Color get bodyText => const Color(0xff6E6B7B);

  @override
  Color get disabledText => const Color(0xffBABFC7);

  @override
  Color get headerDisplayText => const Color(0xff5E5873);

  @override
  Color get mutedPlaceholderText => const Color(0xffB9B9C3);

  @override
  Color get textFieldBackground => const Color(0xffF7F8FC);
}

class DefaultThemeTextStyles extends IAppTextStyles {
  DefaultThemeTextStyles(this.colors);
  IAppColors colors;

  @override
  TextStyle get bodyBold => GoogleFonts.montserrat(fontWeight: FontWeight.bold, color: colors.bodyText, fontSize: 14);

  @override
  TextStyle get bodySemiBold => GoogleFonts.montserrat(fontWeight: FontWeight.w600, color: colors.bodyText, fontSize: 14);

  @override
  TextStyle get body => GoogleFonts.montserrat(fontWeight: FontWeight.normal, color: colors.bodyText, fontSize: 14);

  @override
  TextStyle get bodyL => GoogleFonts.montserrat(fontWeight: FontWeight.w500, color: colors.bodyText, fontSize: 16);

  @override
  TextStyle get bodyS => GoogleFonts.montserrat(fontWeight: FontWeight.normal, color: colors.bodyText, fontSize: 12);

  @override
  TextStyle get bodySBold => GoogleFonts.montserrat(fontWeight: FontWeight.bold, color: colors.bodyText, fontSize: 12);

  @override
  TextStyle get bodySSemiBold => GoogleFonts.montserrat(fontWeight: FontWeight.w500, color: colors.bodyText, fontSize: 12);

  @override
  TextStyle get button => GoogleFonts.montserrat(fontWeight: FontWeight.normal, color: colors.bodyText, fontSize: 14);

  @override
  TextStyle get buttonL => GoogleFonts.montserrat(fontWeight: FontWeight.normal, color: colors.bodyText, fontSize: 16);

  @override
  TextStyle get buttonS => GoogleFonts.montserrat(fontWeight: FontWeight.normal, color: colors.bodyText, fontSize: 11);

  @override
  TextStyle get diplay1 => GoogleFonts.montserrat(fontWeight: FontWeight.normal, color: colors.headerDisplayText, fontSize: 84);

  @override
  TextStyle get diplay2 => GoogleFonts.montserrat(fontWeight: FontWeight.normal, color: colors.headerDisplayText, fontSize: 77);

  @override
  TextStyle get diplay3 => GoogleFonts.montserrat(fontWeight: FontWeight.normal, color: colors.headerDisplayText, fontSize: 63);

  @override
  TextStyle get diplay4 => GoogleFonts.montserrat(fontWeight: FontWeight.normal, color: colors.headerDisplayText, fontSize: 49);

  @override
  TextStyle get h1 => GoogleFonts.montserrat(fontWeight: FontWeight.normal, color: colors.headerDisplayText, fontSize: 28);

  @override
  TextStyle get h2 => GoogleFonts.montserrat(fontWeight: FontWeight.normal, color: colors.headerDisplayText, fontSize: 24);

  @override
  TextStyle get h3 => GoogleFonts.montserrat(fontWeight: FontWeight.w500, color: colors.headerDisplayText, fontSize: 21);

  @override
  TextStyle get h4 => GoogleFonts.montserrat(fontWeight: FontWeight.w500, color: colors.headerDisplayText, fontSize: 18);

  @override
  TextStyle get h5 => GoogleFonts.montserrat(fontWeight: FontWeight.w500, color: colors.headerDisplayText, fontSize: 15);

  @override
  TextStyle get h6 => GoogleFonts.montserrat(fontWeight: FontWeight.w500, color: colors.headerDisplayText, fontSize: 14);

  @override
  TextStyle get input => GoogleFonts.montserrat(fontWeight: FontWeight.normal, color: colors.bodyText, fontSize: 12);

  @override
  TextStyle get inputL => GoogleFonts.montserrat(fontWeight: FontWeight.w500, color: colors.bodyText, fontSize: 16);

  @override
  TextStyle get inputS => GoogleFonts.montserrat(fontWeight: FontWeight.normal, color: colors.bodyText, fontSize: 10);

  @override
  TextStyle get label => GoogleFonts.montserrat(fontWeight: FontWeight.normal, color: colors.bodyText, fontSize: 12);

  @override
  TextStyle get labelL => GoogleFonts.montserrat(fontWeight: FontWeight.normal, color: colors.bodyText, fontSize: 16);

  @override
  TextStyle get labelS => GoogleFonts.montserrat(fontWeight: FontWeight.normal, color: colors.bodyText, fontSize: 10);

  @override
  TextStyle get menu => GoogleFonts.montserrat(fontWeight: FontWeight.normal, color: colors.bodyText, fontSize: 15);

  @override
  TextStyle get placeHoler => GoogleFonts.montserrat(fontWeight: FontWeight.normal, color: colors.bodyText, fontSize: 12);

  @override
  TextStyle get placeHolerL => GoogleFonts.montserrat(fontWeight: FontWeight.normal, color: colors.bodyText, fontSize: 16);

  @override
  TextStyle get placeHolerS => GoogleFonts.montserrat(fontWeight: FontWeight.normal, color: colors.bodyText, fontSize: 10);

  @override
  TextStyle get tableHeader => GoogleFonts.montserrat(fontWeight: FontWeight.normal, color: colors.bodyText, fontSize: 12);

  @override
  TextStyle get splash => GoogleFonts.sourceSansPro(fontWeight: FontWeight.normal, color: colors.bodyText, fontSize: 40);

  @override
  TextStyle get bodyLight => GoogleFonts.montserrat(fontWeight: FontWeight.w200, color: colors.accent, fontSize: 14);

/*
  FontWeight.w100: 'Thin',
  FontWeight.w200: 'ExtraLight',
  FontWeight.w300: 'Light',
  FontWeight.w400: 'Regular',
  FontWeight.w500: 'Medium',
  FontWeight.w600: 'SemiBold',
  FontWeight.w700: 'Bold',.0
  FontWeight.w800: 'ExtraBold',
  FontWeight.w900: 'Black',
*/
}

AppThemeData buildDefaultTheme(BuildContext context, {IAppColors? colors}) {
  var elevation = 0.5;
  var buttonBorderRadius = BorderRadius.circular(5);
  var textBorderRadius = BorderRadius.circular(5);
  var cardBorderRadius = BorderRadius.circular(5);
  var appColors = colors ?? DefaultThemeColors();
  var baseTheme = Theme.of(context);
  var textStyles = DefaultThemeTextStyles(appColors);

  var newTheme = ThemeData(
    fontFamily: GoogleFonts.montserrat.call().fontFamily,
    secondaryHeaderColor: appColors.accent,
    primaryColor: appColors.primary,
    primaryColorLight: appColors.primary,
    primaryColorDark: appColors.primary,
    canvasColor: appColors.canvas,
    disabledColor: appColors.disabled,
    scaffoldBackgroundColor: appColors.canvasPrimaryPale,
    highlightColor: appColors.highlight,
    splashColor: appColors.splash,
    dialogBackgroundColor: appColors.canvas,
    indicatorColor: appColors.primary,
    unselectedWidgetColor: appColors.unselectedWidgetColor,
    toggleButtonsTheme: ToggleButtonsThemeData(
      constraints: const BoxConstraints(minWidth: kMinInteractiveDimension, minHeight: kMinInteractiveDimension * 0.8),
      borderRadius: buttonBorderRadius,
      color: appColors.bodyText,
      selectedColor: appColors.primary,
      disabledColor: appColors.disabled,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      elevation: elevation,
    ),

    cardColor: appColors.canvas,
    chipTheme: ChipThemeData.fromDefaults(
      labelStyle: baseTheme.textTheme.bodyMedium!,
      primaryColor: appColors.primary,
      secondaryColor: appColors.warning,
    ),
    textSelectionTheme:
        baseTheme.textSelectionTheme.copyWith(selectionHandleColor: appColors.primary, selectionColor: appColors.primary.lighten(0.8)),
    popupMenuTheme: PopupMenuThemeData(elevation: elevation),
    floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: appColors.primary, elevation: elevation),
    dividerTheme: DividerThemeData(color: appColors.divider, space: 1, thickness: 1),
    tabBarTheme: TabBarTheme(
        labelColor: appColors.primary,
        unselectedLabelColor: appColors.headerDisplayText,
        labelStyle: textStyles.h5,
        unselectedLabelStyle: textStyles.h5),

    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(size: 25, color: appColors.canvas),
      backgroundColor: appColors.primaryPale,
      elevation: elevation,
      toolbarTextStyle: textStyles.bodyBold.copyWith(
        color: appColors.headerDisplayText,
      ),
      titleTextStyle: textStyles.h2.copyWith(color: appColors.canvas, fontWeight: FontWeight.w600, letterSpacing: 0),
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      color: appColors.canvas,
      elevation: elevation,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      textStyle: textStyles.button.copyWith(color: appColors.canvas),
      elevation: elevation,
      shape: RoundedRectangleBorder(borderRadius: buttonBorderRadius),
    )),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
      elevation: 0,
      backgroundColor: appColors.canvas,
      shape: RoundedRectangleBorder(borderRadius: buttonBorderRadius),
    )),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
      elevation: elevation,
      textStyle: textStyles.button,
      backgroundColor: appColors.canvas,
      side: BorderSide(
        width: 0.5,
        color: appColors.primary,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: buttonBorderRadius,
      ),
    )),
    //Text selection control hala bu temayı kullanıyor.
    buttonTheme: ButtonThemeData(
      buttonColor: appColors.primary,
      textTheme: ButtonTextTheme.primary,
    ),

    cardTheme: CardTheme(
      margin: const EdgeInsets.all(1),
      color: appColors.canvas,
      elevation: elevation,
      shape: RoundedRectangleBorder(borderRadius: cardBorderRadius),
    ),
    snackBarTheme: SnackBarThemeData(
        contentTextStyle: baseTheme.textTheme.bodyMedium!.copyWith(color: appColors.bodyText),
        backgroundColor: appColors.info,
        elevation: elevation,
        actionTextColor: appColors.bodyText),

    textTheme: ThemeUtils.textThemeCopyWith(baseTheme.textTheme, appColors.bodyText, GoogleFonts.montserrat.call().fontFamily!),
    primaryTextTheme: ThemeUtils.textThemeCopyWith(baseTheme.primaryTextTheme, appColors.bodyText, GoogleFonts.montserrat.call().fontFamily!),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(color: appColors.bodyText),
      hintStyle: TextStyle(color: appColors.bodyText.withOpacity(0.7)),
      helperStyle: TextStyle(color: appColors.bodyText),
      prefixStyle: TextStyle(color: appColors.bodyText),
      suffixStyle: TextStyle(color: appColors.bodyText),
      counterStyle: TextStyle(color: appColors.bodyText),
      errorStyle: TextStyle(color: appColors.error.withOpacity(0.7)),
      contentPadding: const EdgeInsets.all(10),
      fillColor: appColors.inputFillColor,
      filled: true,
      isDense: true,
      border: ThemeUtils.inputBorder(
        appColors.canvasDark,
        textBorderRadius,
      ),
      focusedBorder: ThemeUtils.inputBorder(
        appColors.primary.lighten(0.6),
        textBorderRadius,
      ),
      enabledBorder: ThemeUtils.inputBorder(
        appColors.canvasDark,
        textBorderRadius,
      ),
      errorBorder: ThemeUtils.inputBorder(
        appColors.error.lighten(0.7),
        textBorderRadius,
      ),
      focusedErrorBorder: ThemeUtils.inputBorder(
        appColors.error.lighten(0.5),
        textBorderRadius,
      ),
      disabledBorder: ThemeUtils.inputBorder(
        appColors.disabled,
        textBorderRadius,
      ),
    ),
    primaryIconTheme: IconThemeData(color: appColors.primary),
    iconTheme: IconThemeData(color: appColors.canvasDark),
    pageTransitionsTheme: const PageTransitionsTheme(builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    }),
    colorScheme: ColorScheme(
      background: appColors.canvas,
      brightness: Brightness.dark,
      error: appColors.error,
      primary: appColors.primary,
      secondary: appColors.accent,
      surface: appColors.canvas,
      onBackground: appColors.canvasPrimaryPale,
      onError: appColors.error,
      onPrimary: appColors.primary,
      onSecondary: appColors.accent,
      onSurface: appColors.primary,
    ).copyWith(secondary: appColors.accent),
  );

  return AppThemeData(newTheme, appColors, textStyles);
}
