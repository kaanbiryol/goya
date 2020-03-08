import 'package:flutter/widgets.dart';
import 'package:yaml/yaml.dart';

abstract class ThemeLoadable {
  Future<YamlMap> loadThemeProperties(
      {@required BuildContext context, @required String path});
}

class ThemeLoader extends ThemeLoadable {
  @override
  Future<YamlMap> loadThemeProperties(
      {@required BuildContext context, @required String path}) async {
    var yamlFile = await DefaultAssetBundle.of(context).loadString(path);
    YamlMap map = loadYaml(yamlFile);
    return map;
  }
}
