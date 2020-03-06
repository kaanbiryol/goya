import 'package:yaml/yaml.dart';

extension YamlExtension on YamlList {
  List<double> doubleList() {
    return this.map((item) => item as double).toList();
  }
}
