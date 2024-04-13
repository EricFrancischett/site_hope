class DbAboutEntity {
  String aboutPicUrl;
  String ourStoryVideoUrl;
  String thumbOurStory;

  DbAboutEntity({
    required this.aboutPicUrl,
    required this.ourStoryVideoUrl,
    required this.thumbOurStory,
  });

  Map<String, dynamic> toMap() {
    return {
      'aboutPicUrl': aboutPicUrl,
      'ourStoryVideoUrl': ourStoryVideoUrl,
      'thumbOurStory': thumbOurStory,
    };
  }

  factory DbAboutEntity.fromMap(Map<String, dynamic> map) {
    return DbAboutEntity(
      aboutPicUrl: map['aboutPicUrl'],
      ourStoryVideoUrl: map['ourStoryVideoUrl'],
      thumbOurStory: map['thumbOurStory'],
    );
  }
}
