import 'package:flutter/widgets.dart';
import 'package:goya/src/theme_loader.dart';
import 'package:yaml/yaml.dart';

class Goya {
  static final Goya _instance = Goya._internal();
  static Goya get instance => _instance;
  static YamlMap map;
  Goya._internal();

  static Future initialize(BuildContext context, String path) async {
    return map =
        await ThemeLoader().loadThemeProperties(context: context, path: path);
  }
}
