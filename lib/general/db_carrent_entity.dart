class DbCarRentEntity {
  String carRentPicUrl;
  List<String> logosUrl;

  DbCarRentEntity({
    required this.carRentPicUrl,
    required this.logosUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'carRentPicUrl': carRentPicUrl,
      'logosUrl': logosUrl,
    };
  }

  factory DbCarRentEntity.fromMap(Map<String, dynamic> map) {
    return DbCarRentEntity(
      carRentPicUrl: map['carRentPicUrl'],
      logosUrl: List<String>.from(map['logosUrl']),
    );
  }
}
