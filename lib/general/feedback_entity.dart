class FeedBackEntity {
  String name;
  String thumbUrl;
  String videoUrl;

  FeedBackEntity({
    required this.name,
    required this.thumbUrl,
    required this.videoUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'thumbUrl': thumbUrl,
      'videoUrl': videoUrl,
    };
  }

  factory FeedBackEntity.fromMap(Map<String, dynamic> map) {
    return FeedBackEntity(
      name: map['name'],
      thumbUrl: map['thumbUrl'],
      videoUrl: map['videoUrl'],
    );
  }
}
