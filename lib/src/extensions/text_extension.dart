import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:goya/src/theme_symbol.dart';
import 'package:goya/src/adapters/text_adapters.dart';
import 'package:goya/src/extensions/text_style_extension.dart';
import 'package:goya/src/extensions/widget_extension.dart';
import '../goya_builder.dart';

extension TextExtension on Text {
  Text toGoya(Text goyaText) {
    return Text(goyaText.data,
        key: goyaText.key,
        style: goyaText.style,
        strutStyle: goyaText.strutStyle,
        textAlign: textAlign ?? goyaText.textAlign,
        textDirection: goyaText.textDirection,
        locale: goyaText.locale,
        softWrap: goyaText.softWrap,
        overflow: goyaText.overflow,
        textScaleFactor: goyaText.textScaleFactor,
        maxLines: goyaText.maxLines,
        semanticsLabel: goyaText.semanticsLabel,
        textWidthBasis: goyaText.textWidthBasis);
  }
}

class TextBuilder implements GoyaBuilderStrategy<Text> {
  @override
  Widget build(Text originalWidget, {ThemeSymbol using}) {
    var alignmentValue = using.goyaValue(StyleIdentifier.align);
    var colorValue = using.goyaValue(StyleIdentifier.color);
    var backgroundColorValue = using.goyaValue(StyleIdentifier.backgroundColor);
    var fontSizeValue = using.goyaValue(StyleIdentifier.fontSize);
    var fontWeightValue = using.goyaValue(StyleIdentifier.fontWeight);
    var letterSpacingValue = using.goyaValue(StyleIdentifier.letterSpacing);
    var wordSpacingValue = using.goyaValue(StyleIdentifier.wordSpacing);
    var fontFamilyValue = using.goyaValue(StyleIdentifier.fontFamily);

    TextStyle goyaTextStyle = TextStyle(
        color: Color(colorValue),
        backgroundColor: Color(backgroundColorValue),
        fontWeight: GoyaText.fontWeight(fontWeightValue),
        fontSize: fontSizeValue,
        letterSpacing: letterSpacingValue,
        wordSpacing: wordSpacingValue,
        fontFamily: fontFamilyValue);
    Text goyaText = Text(originalWidget.data,
        textAlign: GoyaText.align(alignmentValue),
        style: originalWidget.style != null
            ? originalWidget.style.toGoya(goyaTextStyle)
            : TextStyle().toGoya(goyaTextStyle));
    return originalWidget.toGoya(goyaText).preparePaint(using);
  }
}
