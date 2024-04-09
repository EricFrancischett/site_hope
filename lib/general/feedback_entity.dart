class FeedBackEntity {
  String name;
  String locale;
  String thumbUrl;
  String videoUrl;

  FeedBackEntity({
    required this.name,
    required this.thumbUrl,
    required this.videoUrl,
    required this.locale,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'locale': locale,
      'thumbUrl': thumbUrl,
      'videoUrl': videoUrl,
    };
  }

  factory FeedBackEntity.fromMap(Map<String, dynamic> map) {
    return FeedBackEntity(
      name: map['name'],
      locale: map['locale'],
      thumbUrl: map['thumbUrl'],
      videoUrl: map['videoUrl'],
    );
  }
}
