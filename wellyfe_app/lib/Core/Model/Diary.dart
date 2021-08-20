class Diary {
  final DateTime dateTime;
  final String mood;
  final String weather;
  final String title;
  final String content;
  final String picture;
  bool favourite;

  Diary(
    this.dateTime,
    this.mood,
    this.weather,
    this.title,
    this.content,
    this.picture,
    this.favourite,
  );
}