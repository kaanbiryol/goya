import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:goya/goya.dart';

class MockApp extends StatelessWidget {
  const MockApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GoyaProvider(path: _goyaPath(), child: Container());
  }

  String _goyaPath() {
    Directory current = Directory.current;
    String rootPath =
        current.path.endsWith("/test") ? current.path : current.path + "/test";
    return rootPath + "/goya.yaml";
  }
}

class MockPage extends StatelessWidget {
  const MockPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          child: Text("Goya").goya(key: MockKeys.text),
          height: 200,
          width: 200,
        ).goya(key: MockKeys.container)
      ],
    );
  }
}

class MockKeys {
  static const ThemeSymbol container = ThemeSymbol(".Container");
  static const ThemeSymbol text = ThemeSymbol(".Text");
  static const ThemeSymbol custom = ThemeSymbol(".Custom");
}
