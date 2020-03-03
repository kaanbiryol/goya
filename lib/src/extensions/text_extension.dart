import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:goya/src/finder.dart';
import 'package:goya/src/theme_symbol.dart';

import '../goya_builder.dart';

extension TextExtension on Text {
  Text paint(Text goyaText) {
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
    stringFinder(using.identifier, StyleIdentifier.align);
    // Color color = Color(stringFinder(using.identifier, StyleIdentifier.color));
    Text goyaText = Text(
      originalWidget.data,
      textAlign: TextAlign.center,
    );
    return originalWidget.paint(goyaText);
  }
}
