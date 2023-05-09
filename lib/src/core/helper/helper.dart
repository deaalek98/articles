import 'package:intl/intl.dart';
import 'package:articles/src/core/core.dart';

class Helper {
  static String? deviceLanguageCode;

  static String getLang() {
    return sl<AppSharedPrefs>().getLang();
  }

  static String getDateFormat({String? createdAt}) {
    return createdAt == null ? "" : DateFormat('dd MMMM y').format(DateTime.parse(createdAt)).toString();
  }

  static getSvgImage(String filename) {
    return SVG_PATH + filename;
  }

  static getImage(String filename) {
    return IMAGE_PATH + filename;
  }

  //Filter days
  static List<int> getListFilter() {
    return [1, 7, 30];
  }

}
