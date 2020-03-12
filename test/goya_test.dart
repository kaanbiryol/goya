import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:goya/goya.dart';

import 'goya_mock.dart';

Widget get mockWidget => buildTestableWidget(MockApp());
Widget buildTestableWidget(Widget widget) {
  return MaterialApp(
    home: Scaffold(body: widget),
  );
}

void main() {
  testWidgets('goya provider init', (WidgetTester tester) async {
    await tester.pumpWidget(mockWidget);

    expect(Goya.map, isNotNull);
    expect(Goya.map, isNotEmpty);
  });

  testWidgets('padding goya', (WidgetTester tester) async {
    await tester.pumpWidget(mockWidget);

    Widget mockContainer = Container().goya(key: MockKeys.container);

    expect(mockContainer, isInstanceOf<Padding>());
    expect((mockContainer as Padding).padding,
        EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 16.0));
  });

  testWidgets('container goya', (WidgetTester tester) async {
    await tester.pumpWidget(mockWidget);

    Padding containerWithPadding = Container().goya(key: MockKeys.container);
    Container mockContainer = containerWithPadding.child as Container;
    Color containerColor =
        (mockContainer.decoration as BoxDecoration)?.color ?? Color(0xFF87CEFA);
    Color goyaColor = Color(0xFF87CEFA);

    expect(containerColor, goyaColor);
  });

  testWidgets('text goya', (WidgetTester tester) async {
    await tester.pumpWidget(mockWidget);

    Padding textWithPadding = Text("DATA").goya(key: MockKeys.text);
    Text mockText = textWithPadding.child as Text;

    expect(mockText.textAlign, TextAlign.center);
    expect(mockText.style.color, Color(0xFF87CEFA));
    expect(mockText.style.backgroundColor, Color(0xFFFF9000));
    expect(mockText.style.fontSize, 48.0);
    expect(mockText.style.fontWeight, FontWeight.w900);
    expect(mockText.style.letterSpacing, 0.1);
    expect(mockText.style.wordSpacing, 0.2);
    expect(mockText.style.fontFamily, "Pacifico");
  });
}
