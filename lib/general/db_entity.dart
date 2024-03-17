class DbEntity {
  String homePicUrl;
  List<TicketEntity> tickets;
  MainOfferEntity mainOffer;
  List<DestinationEntity> destinations;
  List<PackEntity> packs;
  List<HotelEntity> hotels;
  List<FeedBackEntity> feedbacks;
  String serviceImageUrl;
  String faqImageUrl;

  DbEntity({
    required this.homePicUrl,
    required this.tickets,
    required this.mainOffer,
    required this.destinations,
    required this.packs,
    required this.hotels,
    required this.feedbacks,
    required this.serviceImageUrl,
    required this.faqImageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'homePicUrl': homePicUrl,
      'tickets': tickets.map((ticket) => ticket.toMap()).toList(),
      'mainOffer': mainOffer.toMap(),
      'destinations':
          destinations.map((destination) => destination.toMap()).toList(),
      'packs': packs.map((pack) => pack.toMap()).toList(),
      'hotels': hotels.map((hotel) => hotel.toMap()).toList(),
      'feedbacks': feedbacks.map((feedback) => feedback.toMap()).toList(),
      'serviceImageUrl': serviceImageUrl,
      'faqImageUrl': faqImageUrl,
    };
  }

  factory DbEntity.fromMap(Map<String, dynamic> map) {
    return DbEntity(
      homePicUrl: map['homePicUrl'],
      tickets: List<TicketEntity>.from(
          map['tickets']?.map((ticket) => TicketEntity.fromMap(ticket))),
      mainOffer: MainOfferEntity.fromMap(map['mainOffer']),
      destinations: List<DestinationEntity>.from(map['destinations']
          ?.map((destination) => DestinationEntity.fromMap(destination))),
      packs: List<PackEntity>.from(
          map['packs']?.map((pack) => PackEntity.fromMap(pack))),
      hotels: List<HotelEntity>.from(
          map['hotels']?.map((hotel) => HotelEntity.fromMap(hotel))),
      feedbacks: List<FeedBackEntity>.from(map['feedbacks']
          ?.map((feedback) => FeedBackEntity.fromMap(feedback))),
      serviceImageUrl: map['serviceImageUrl'],
      faqImageUrl: map['faqImageUrl'],
    );
  }
}

class TicketEntity {
  String title;
  String description;
  String imageUrl;
  String price;

  TicketEntity({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'price': price,
    };
  }

  factory TicketEntity.fromMap(Map<String, dynamic> map) {
    return TicketEntity(
      title: map['title'],
      description: map['description'],
      imageUrl: map['imageUrl'],
      price: map['price'],
    );
  }
}

class MainOfferEntity {
  String title;
  String description;
  String imageUrl;
  String price;
  String payment;

  MainOfferEntity({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.payment,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'price': price,
      'payment': payment,
    };
  }

  factory MainOfferEntity.fromMap(Map<String, dynamic> map) {
    return MainOfferEntity(
      title: map['title'],
      description: map['description'],
      imageUrl: map['imageUrl'],
      price: map['price'],
      payment: map['payment'],
    );
  }
}

class DestinationEntity {
  String title;
  String imageUrl;
  int index;

  DestinationEntity({
    required this.title,
    required this.imageUrl,
    required this.index,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'imageUrl': imageUrl,
      'price': index,
    };
  }

  factory DestinationEntity.fromMap(Map<String, dynamic> map) {
    return DestinationEntity(
      title: map['title'],
      imageUrl: map['imageUrl'],
      index: map['index'],
    );
  }
}

class PackEntity {
  String title;
  String type;
  String quantity;
  int days;
  String imageUrl;

  PackEntity({
    required this.title,
    required this.type,
    required this.quantity,
    required this.days,
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'type': type,
      'quantity': quantity,
      'days': days,
      'imageUrl': imageUrl,
    };
  }

  factory PackEntity.fromMap(Map<String, dynamic> map) {
    return PackEntity(
      title: map['title'],
      type: map['type'],
      quantity: map['quantity'],
      days: map['days'],
      imageUrl: map['imageUrl'],
    );
  }
}

class HotelEntity {
  String imageUrl;

  HotelEntity({
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
    };
  }

  factory HotelEntity.fromMap(Map<String, dynamic> map) {
    return HotelEntity(
      imageUrl: map['imageUrl'],
    );
  }
}

class FeedBackEntity {
  String name;
  String location;
  String message;
  String imageUrl;

  FeedBackEntity({
    required this.name,
    required this.location,
    required this.message,
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'location': location,
      'message': message,
      'imageUrl': imageUrl,
    };
  }

  factory FeedBackEntity.fromMap(Map<String, dynamic> map) {
    return FeedBackEntity(
      name: map['name'],
      location: map['location'],
      message: map['message'],
      imageUrl: map['imageUrl'],
    );
  }
}
