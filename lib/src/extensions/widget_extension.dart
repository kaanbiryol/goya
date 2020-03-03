import 'package:flutter/widgets.dart';
import 'package:goya/src/goya_builder.dart';
import 'package:goya/src/theme_symbol.dart';

extension WidgetExtension on Widget {
  Widget goya({@required ThemeSymbol key}) {
    var strategy = type(runtimeType);
    return strategy.build(this, using: key);
  }
}
