import '../goya.dart';

abstract class ThemeSymbolable {
  final String identifier;
  const ThemeSymbolable(this.identifier);
}

class ThemeSymbol extends ThemeSymbolable {
  const ThemeSymbol(String identifier) : super(identifier);
}

extension ThemeSymbolExtension on ThemeSymbol {
  dynamic get goyaValue => Goya.map[identifier];
}

abstract class StyleIdentifier {
  static const String color = ".color";
  static const String align = ".align";
}
