import 'package:flutter/widgets.dart';

class GoyaText {
  static TextAlign align(String identifier) {
    return TextAlign.values.firstWhere((align) => align._value == identifier);
  }

  static FontWeight fontWeight(int identifier) {
    return FontWeight.values.firstWhere((weight) => weight.index == identifier);
  }
}

extension on TextAlign {
  String get _value => toString().split('.').last;
}
