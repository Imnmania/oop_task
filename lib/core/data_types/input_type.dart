enum InputType {
  json,
  xml;

  static InputType fromInput(String input) {
    if (input.contains('{') && input.contains('}')) {
      return json;
    }
    if (input.contains('<') && input.contains('>')) {
      return xml;
    }
    throw Exception('Input type not supported!');
  }
}
