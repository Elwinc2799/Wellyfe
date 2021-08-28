class UserProfile {
  String imageUrl;
  String userEmail;
  String personality;
  String name;

  UserProfile(
    this.imageUrl,
    this.userEmail,
    this.personality,
    this.name,
  );

  static UserProfile userDetails = UserProfile("", "", "", "");
}