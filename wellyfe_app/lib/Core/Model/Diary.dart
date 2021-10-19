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

  List<String> emojiList = [
    "happy", "very happy", "sad", "sleepy", "annoyed", "angry", "in love", "surprised",
  ];
  List<String> weatherList = [
    "sunny", "rainy", "thunderstorm", "cloudy", "overcast", "snow", "windy", "foggy",
  ];

  static String newImageUrl = "";



  static int getDaysWithDiary(List<Diary> monthlyDiary) {
    var map = Map();

    monthlyDiary.forEach((element) {
      if(!map.containsKey(element.dateTime.day)) {
        map[element.dateTime.day] = 1;
      } else {
        map[element.dateTime.day] += 1;
      }
    });

    return map.length;
  }
}