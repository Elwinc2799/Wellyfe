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

  static List<Diary> diaryDataList = [];
  static String newImageUrl = "";

  static List<Diary> getMonthlyDiary(int month) {
    return diaryDataList.where(
      (element) => (element.dateTime.month == month)
    ).toList();
  }

  static int getFavourite() {
    return diaryDataList.where(
        (element) => (element.favourite == true)
    ).toList().length;
  }

  static Diary getSpecificDiary(String diaryID) {
    Diary diary = diaryDataList.firstWhere(
      (element) => element.diaryID == diaryID,
    );
    return diary;
  }

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

  static Map<dynamic, dynamic> getWeatherOccurrence() {
    var map = Map();

    diaryDataList.forEach(
      (element) => map[element.weather] = !map.containsKey(element.weather) ? (1) : (map[element.weather] + 1)
    );

    return map;
  }

  static Map<dynamic, dynamic> getMoodOccurrence() {
    var map = Map();

    diaryDataList.forEach(
      (element) => map[element.mood] = !map.containsKey(element.mood) ? (1) : (map[element.mood] + 1)
    );

    return map;
  }
}