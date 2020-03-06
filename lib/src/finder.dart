import '../goya.dart';

bool isPrimitive(Type type) {
  switch (type) {
    case String:
      return true;
      break;
    case int:
      return true;
    case double:
      return true;
    case List:
      return true;
    default:
      return false;
  }
}

dynamic finder(dynamic element, String styleIdentifier) {
  if (element == null || element.value == null) {
    return null;
  }
  var elementValue = element.value;
  if (isPrimitive(elementValue.runtimeType) && element.key == styleIdentifier) {
    return elementValue;
  }
  for (dynamic entry in elementValue.entries) {
    print("finder: " + entry.toString());
    if (entry == null) {
      //TODO: exception
      return null;
    }
    finder(entry, styleIdentifier);
  }
}

dynamic stringFinder(String key, String identifier) {
  return Goya.map[key][identifier];
}
