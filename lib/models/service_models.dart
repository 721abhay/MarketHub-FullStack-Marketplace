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

class LuxuryProduct {
  final String id;
  final String name;
  final double price;
  final String brand;
  final String imageUrl;

  LuxuryProduct({
    required this.id,
    required this.name,
    required this.price,
    required this.brand,
    required this.imageUrl,
  });

  factory LuxuryProduct.fromMap(Map<String, dynamic> map) {
    return LuxuryProduct(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      price: (map['price'] ?? 0.0).toDouble(),
      brand: map['brand'] ?? '',
      imageUrl: map['image'] ?? '',
    );
  }
}

class GroceryDeal {
  final String id;
  final String name;
  final double price;
  final String unit;
  final String discount;

  GroceryDeal({
    required this.id,
    required this.name,
    required this.price,
    required this.unit,
    required this.discount,
  });

  factory GroceryDeal.fromMap(Map<String, dynamic> map) {
    return GroceryDeal(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      price: (map['price'] ?? 0.0).toDouble(),
      unit: map['unit'] ?? '',
      discount: map['discount'] ?? '',
    );
  }
}

class FinanceOffering {
  final String id;
  final String name;
  final String rate;
  final double minDeposit;
  final String type;

  FinanceOffering({
    required this.id,
    required this.name,
    required this.rate,
    required this.minDeposit,
    required this.type,
  });

  factory FinanceOffering.fromMap(Map<String, dynamic> map) {
    return FinanceOffering(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      rate: map['rate'] ?? '',
      minDeposit: (map['minDeposit'] ?? 0.0).toDouble(),
      type: map['type'] ?? '',
    );
  }
}

class IoTDevice {
  final String id;
  final String name;
  final String status;
  final String battery;
  final String room;

  IoTDevice({
    required this.id,
    required this.name,
    required this.status,
    required this.battery,
    required this.room,
  });

  factory IoTDevice.fromMap(Map<String, dynamic> map) {
    return IoTDevice(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      status: map['status'] ?? '',
      battery: map['battery'] ?? '',
      room: map['room'] ?? '',
    );
  }
}

class Course {
  final String id;
  final String title;
  final String instructor;
  final String duration;
  final String thumbnailUrl;
  final String category;
  final double price;
  final double rating;

  Course({
    required this.id,
    required this.title,
    required this.instructor,
    required this.duration,
    required this.thumbnailUrl,
    required this.category,
    required this.price,
    required this.rating,
  });

  factory Course.fromMap(Map<String, dynamic> map) {
    return Course(
      id: map['_id'] ?? (map['id'] ?? ''),
      title: map['title'] ?? '',
      instructor: map['instructor'] ?? '',
      duration: map['duration'] ?? '',
      thumbnailUrl: map['thumbnail'] ?? '',
      category: map['category'] ?? '',
      price: (map['price'] ?? 0.0).toDouble(),
      rating: (map['rating'] ?? 0.0).toDouble(),
    );
  }
}

class EventModel {
  final String id;
  final String name;
  final String location;
  final String date;
  final String organizer;
  final String imageUrl;
  final String category;

  EventModel({
    required this.id,
    required this.name,
    required this.location,
    required this.date,
    required this.organizer,
    required this.imageUrl,
    required this.category,
  });

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      id: map['_id'] ?? (map['id'] ?? ''),
      name: map['name'] ?? '',
      location: map['location'] ?? '',
      date: map['date'] ?? '',
      organizer: map['organizer'] ?? '',
      imageUrl: map['image'] ?? '',
      category: map['category'] ?? '',
    );
  }
}

class UserBadge {
  final String id;
  final String name;
  final String description;
  final String iconUrl;
  final int xpValue;
  final String tier;

  UserBadge({
    required this.id,
    required this.name,
    required this.description,
    required this.iconUrl,
    required this.xpValue,
    required this.tier,
  });

  factory UserBadge.fromMap(Map<String, dynamic> map) {
    return UserBadge(
      id: map['_id'] ?? (map['id'] ?? ''),
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      iconUrl: map['iconUrl'] ?? '',
      xpValue: map['xpValue'] ?? 0,
      tier: map['tier'] ?? '',
    );
  }
}
