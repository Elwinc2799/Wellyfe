class Diary {
  final String diaryID;
  final DateTime dateTime;
  final String mood;
  final String weather;
  final String title;
  final String content;
  final String picture;
  bool favourite;

  Diary(
    this.diaryID,
    this.title,
    this.content,
    this.mood,
    this.weather,
    this.picture,
    this.favourite,
    this.dateTime,
  );

  static List<Diary> diaryDataList = [];
  static String newImageUrl = "";
}