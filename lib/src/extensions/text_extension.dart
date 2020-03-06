import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:goya/src/finder.dart';
import 'package:goya/src/theme_symbol.dart';
import 'package:goya/src/adapters/text_adapters.dart';
import 'package:goya/src/extensions/text_style_extension.dart';
import 'package:goya/src/extensions/widget_extension.dart';
import '../goya_builder.dart';

extension TextExtension on Text {
  Text prepare(Text goyaText) {
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
    var alignmentValue = stringFinder(using.identifier, StyleIdentifier.align);
    var colorValue = stringFinder(using.identifier, StyleIdentifier.color);
    var backgroundColorValue =
        stringFinder(using.identifier, StyleIdentifier.backgroundColor);
    var fontSizeValue =
        stringFinder(using.identifier, StyleIdentifier.fontSize);
    var fontWeightValue =
        stringFinder(using.identifier, StyleIdentifier.fontWeight);
    var letterSpacingValue =
        stringFinder(using.identifier, StyleIdentifier.letterSpacing);
    var wordSpacingValue =
        stringFinder(using.identifier, StyleIdentifier.wordSpacing);
    var fontFamilyValue =
        stringFinder(using.identifier, StyleIdentifier.fontFamily);

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
            ? originalWidget.style.prepare(goyaTextStyle)
            : TextStyle().prepare(goyaTextStyle));
    return originalWidget.prepare(goyaText).preparePaint(using);
  }
}
