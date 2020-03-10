import 'package:flutter/widgets.dart';
import 'package:goya/src/goya_builder.dart';
import 'package:goya/src/theme_symbol.dart';
import 'package:yaml/yaml.dart';
import 'package:goya/src/extensions/yaml_extension.dart';

extension WidgetGoyaExtension on Widget {
  Widget goya({@required ThemeSymbol key, GoyaBuilderStrategy builder}) {
    var strategy = builder ?? type(runtimeType);
    return strategy.build(this, using: key);
  }
}

extension WidgetExtension on Widget {
  Widget guard(Widget widgetFunction(), dynamic variable) {
    return variable == null ? this : widgetFunction();
  }

  Widget preparePaint(ThemeSymbol symbol) {
    var insets =
        (symbol.goyaValue(StyleIdentifier.padding) as YamlList)?.doubleList();
    return _paint(paddingInsets: insets);
  }

  Widget _paint({List<double> paddingInsets}) {
    return padding(paddingInsets);
  }

  Widget padding(List<double> insets) {
    return guard(() {
      return Padding(
        padding:
            EdgeInsets.fromLTRB(insets[0], insets[1], insets[2], insets[3]),
        child: this,
      );
    }, insets);
  }
}
