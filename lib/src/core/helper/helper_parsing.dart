class HelperParsing {
  static String? parsingString(dynamic data) {
    if (data == null) {
      return null;
    }
    return "$data";
  }

  static int? parsingInt(dynamic data) {
    if (data == null) {
      return null;
    }
    int temp = int.tryParse(data) ?? 0;
    return temp;
  }

  static double? parsingDouble(dynamic data) {
    if (data == null) {
      return null;
    }
    double temp = double.tryParse(data) ?? 0;
    return temp;
  }
}
