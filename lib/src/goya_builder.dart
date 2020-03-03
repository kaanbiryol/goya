import 'package:flutter/widgets.dart';
import 'package:goya/src/extensions/container_extension.dart';
import 'package:goya/src/extensions/text_extension.dart';
import 'package:goya/src/theme_symbol.dart';

abstract class GoyaBuilderStrategy<T extends Widget> {
  Widget build(T originalWidget, {@required ThemeSymbol using});
}

GoyaBuilderStrategy type(dynamic runtimeType) {
  switch (runtimeType) {
    case Container:
      return ContainerBuilder();
      break;
    case Text:
      return TextBuilder();
    default:
      return null;
  }
}
