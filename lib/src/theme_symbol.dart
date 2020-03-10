import '../goya.dart';

abstract class ThemeSymbolable {
  final String identifier;
  const ThemeSymbolable(this.identifier);
}

class ThemeSymbol extends ThemeSymbolable {
  const ThemeSymbol(String identifier) : super(identifier);
}

extension ThemeSymbolExtension on ThemeSymbol {
  dynamic goyaValue(String styleIdentifier) =>
      Goya.map[identifier][styleIdentifier];
}

abstract class StyleIdentifier {
  static const String align = ".align";
  static const String color = ".color";
  static const String backgroundColor = ".backgroundColor";
  static const String fontSize = ".fontSize";
  static const String fontWeight = ".fontWeight";
  static const String fontFamily = ".fontFamily";
  static const String wordSpacing = ".wordSpacing";
  static const String letterSpacing = ".letterSpacing";
  static const String padding = ".padding";
}
