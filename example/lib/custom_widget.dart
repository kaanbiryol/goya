import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:goya/goya.dart';

class CustomStyleIdentifier extends StyleIdentifier {
  static const String customProperty = ".customProperty";
}

class CustomWidgetGoyaBuilder extends GoyaBuilderStrategy<CustomWidget> {
  @override
  Widget build(CustomWidget originalWidget, {ThemeSymbol using}) {
    var color = Color(using.goyaValue(CustomStyleIdentifier.customProperty));
    CustomWidget goyaContainer = CustomWidget(color: color);
    return originalWidget.toGoya(goyaContainer).preparePaint(using);
  }
}

class CustomWidget extends StatelessWidget {
  final Color color;
  const CustomWidget({this.color, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          Icons.favorite,
          color: color ?? Colors.pink,
          size: 24.0,
        ),
        FlatButton(
          onPressed: () {},
          child: Text("Goya Button"),
          color: Colors.red,
        )
      ],
    );
  }
}

extension CustomWidgetExtension on CustomWidget {
  CustomWidget toGoya(CustomWidget goyaWidget) {
    return CustomWidget(color: color ?? goyaWidget.color);
  }
}
