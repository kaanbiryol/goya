import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:goya/goya.dart';
import 'package:goya/src/goya_builder.dart';
import 'package:goya/src/theme_symbol.dart';

extension ContainerExtension on Container {
  Container toGoya(Container goyaContainer) {
    Color goyaColor = (goyaContainer.decoration as BoxDecoration)?.color;
    return Container(
      key: key,
      alignment: alignment,
      padding: padding,
      decoration: decoration ??
          (goyaColor != null ? BoxDecoration(color: goyaColor) : null),
      foregroundDecoration: foregroundDecoration,
      constraints: constraints,
      margin: margin,
      transform: transform,
      child: child,
    );
  }
}

class ContainerBuilder implements GoyaBuilderStrategy<Container> {
  @override
  Widget build(Container originalWidget, {ThemeSymbol using}) {
    Color color = Color(using.goyaValue(StyleIdentifier.color));
    Container goyaContainer = Container(color: color);
    return originalWidget.toGoya(goyaContainer).preparePaint(using);
  }
}
