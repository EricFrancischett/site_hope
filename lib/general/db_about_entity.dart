class DbAboutEntity {
  String aboutPicUrl;
  String ourStoryVideoUrl;

  DbAboutEntity({
    required this.aboutPicUrl,
    required this.ourStoryVideoUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'aboutPicUrl': aboutPicUrl,
      'ourStoryVideoUrl': ourStoryVideoUrl,
    };
  }

  factory DbAboutEntity.fromMap(Map<String, dynamic> map) {
    return DbAboutEntity(
      aboutPicUrl: map['aboutPicUrl'],
      ourStoryVideoUrl: map['ourStoryVideoUrl'],
    );
  }
}
