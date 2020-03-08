import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

extension TextExtension on TextStyle {
  TextStyle toGoya(TextStyle goyaTextStyle) {
    return TextStyle(
      inherit: inherit,
      color: color ?? goyaTextStyle.color,
      backgroundColor: backgroundColor ?? goyaTextStyle.backgroundColor,
      fontSize: fontSize ?? goyaTextStyle.fontSize,
      fontWeight: fontWeight ?? goyaTextStyle.fontWeight,
      //TODO
      fontStyle: fontStyle,
      letterSpacing: letterSpacing ?? goyaTextStyle.letterSpacing,
      wordSpacing: wordSpacing ?? goyaTextStyle.wordSpacing,
      //TODO
      textBaseline: textBaseline,
      height: height,
      locale: locale,
      foreground: foreground,
      background: background,
      shadows: shadows,
      fontFeatures: fontFeatures,
      //TODO
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
      debugLabel: debugLabel,
      fontFamily: fontFamily ?? goyaTextStyle.fontFamily,
      fontFamilyFallback: fontFamilyFallback,
      // package: package?
    );
  }
}
