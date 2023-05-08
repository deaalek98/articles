class DataHelper {
  DataHelper._privateConstructor();

  static final DataHelper _instance = DataHelper._privateConstructor();

  static DataHelper get instance => _instance;

  List<String> getSections() {
    return [
      "All",
      "Entertainment",
      "General",
      "Health",
      "Science",
      "Sports",
      "Technology",
    ];
  }
}
