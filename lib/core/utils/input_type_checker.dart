class DataTypeChecker {
  DataTypeChecker._internal();

  static InputType checkInputType(String input) {
    if (input.contains('<') && input.contains('>')) {
      return InputType.xml;
    }
    if (input.contains('{') && input.contains('}')) {
      return InputType.json;
    }
    throw Exception('Input type not supported!');
  }
}

enum InputType {
  json,
  xml;
}
