class RecommendedActivity {
  final String activity;
  final String icon;
  final String duration;

  RecommendedActivity(
    this.activity,
    this.icon,
    this.duration
  );

  static List<RecommendedActivity> recommendedList = [
    RecommendedActivity("Cycling", "assets/logo/cycling.png", "50 min"),
    RecommendedActivity("Jogging", "assets/logo/steps.png", "50 min"),
    RecommendedActivity("Football", "assets/logo/football.png", "50 min"),
    RecommendedActivity("Basketball", "assets/logo/basketball.png", "50 min"),
    RecommendedActivity("Badminton", "assets/logo/badminton.png", "50 min"),
    RecommendedActivity("Volleyball", "assets/logo/volleyball.png", "50 min"),
    RecommendedActivity("Tennis", "assets/logo/tennis.png", "50 min"),
  ];
}