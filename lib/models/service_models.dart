import 'dart:convert';

class TravelDeal {
  final String id;
  final String from;
  final String to;
  final double price;
  final String date;
  final String type; // airline, bus_operator, train_name
  final String imageUrl;

  TravelDeal({
    required this.id,
    required this.from,
    required this.to,
    required this.price,
    required this.date,
    required this.type,
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'from': from,
      'to': to,
      'price': price,
      'date': date,
      'type': type,
      'imageUrl': imageUrl,
    };
  }

  factory TravelDeal.fromMap(Map<String, dynamic> map) {
    return TravelDeal(
      id: map['id'] ?? '',
      from: map['from'] ?? map['operator'] ?? map['name'] ?? '',
      to: map['to'] ?? '',
      price: (map['price'] ?? 0.0).toDouble(),
      date: map['date'] ?? map['time'] ?? '',
      type: map['airline'] ?? map['type'] ?? 'Travel',
      imageUrl: map['logo'] ?? map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TravelDeal.fromJson(String source) => TravelDeal.fromMap(json.decode(source));
}

class HomeService {
  final String id;
  final String title;
  final double price;
  final double rating;
  final String imageUrl;

  HomeService({
    required this.id,
    required this.title,
    required this.price,
    required this.rating,
    required this.imageUrl,
  });

  factory HomeService.fromMap(Map<String, dynamic> map) {
    return HomeService(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      price: (map['price'] ?? 0.0).toDouble(),
      rating: (map['rating'] ?? 0.0).toDouble(),
      imageUrl: map['image'] ?? '',
    );
  }
}

class HealthProvider {
  final String id;
  final String name;
  final String specialty;
  final String experience;
  final double rating;
  final int fee;
  final String imageUrl;

  HealthProvider({
    required this.id,
    required this.name,
    required this.specialty,
    required this.experience,
    required this.rating,
    required this.fee,
    required this.imageUrl,
  });

  factory HealthProvider.fromMap(Map<String, dynamic> map) {
    return HealthProvider(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      specialty: map['specialty'] ?? '',
      experience: map['experience'] ?? '',
      rating: (map['rating'] ?? 0.0).toDouble(),
      fee: map['fee'] ?? 0,
      imageUrl: map['image'] ?? '',
    );
  }
}

class JobListing {
  final String id;
  final String title;
  final String company;
  final String location;
  final String salary;
  final String type;

  JobListing({
    required this.id,
    required this.title,
    required this.company,
    required this.location,
    required this.salary,
    required this.type,
  });

  factory JobListing.fromMap(Map<String, dynamic> map) {
    return JobListing(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      company: map['company'] ?? '',
      location: map['location'] ?? '',
      salary: map['salary'] ?? '',
      type: map['type'] ?? '',
    );
  }
}

class RealEstateProperty {
  final String id;
  final String title;
  final String location;
  final int price;
  final String type;
  final String imageUrl;

  RealEstateProperty({
    required this.id,
    required this.title,
    required this.location,
    required this.price,
    required this.type,
    required this.imageUrl,
  });

  factory RealEstateProperty.fromMap(Map<String, dynamic> map) {
    return RealEstateProperty(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      location: map['location'] ?? '',
      price: map['price'] ?? 0,
      type: map['type'] ?? '',
      imageUrl: map['image'] ?? '',
    );
  }
}
