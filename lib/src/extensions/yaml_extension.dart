import 'package:yaml/yaml.dart';

extension YamlExtension on YamlList {
  List<double> doubleList() {
    return map((item) => item as double).toList();
  }
}
