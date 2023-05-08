import 'package:intl/intl.dart';

class HelperUtil {
  HelperUtil._privateConstructor();

  static final HelperUtil _instance = HelperUtil._privateConstructor();

  static HelperUtil get instance => _instance;

  String getSections(String date) {
    if (date.isEmpty){
      return "";
    }
    DateTime tempDate = new DateFormat("yyyy-MM-dd hh:mm:ss").parse(date);
    return DateFormat('yyyy-MM-dd hh:mm').format(tempDate);
  }
}
