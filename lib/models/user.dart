import 'dart:convert';

class SellerDetails {
  final String? storeName;
  final String? storeDescription;
  final String? storeLogo;
  final String? storeBanner;
  final String? gstNumber;
  final String? bankAccount;
  final bool isVerified;

  SellerDetails({
    this.storeName,
    this.storeDescription,
    this.storeLogo,
    this.storeBanner,
    this.gstNumber,
    this.bankAccount,
    this.isVerified = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'storeName': storeName,
      'storeDescription': storeDescription,
      'storeLogo': storeLogo,
      'storeBanner': storeBanner,
      'gstNumber': gstNumber,
      'bankAccount': bankAccount,
      'isVerified': isVerified,
    };
  }

  factory SellerDetails.fromMap(Map<String, dynamic> map) {
    return SellerDetails(
      storeName: map['storeName'],
      storeDescription: map['storeDescription'],
      storeLogo: map['storeLogo'],
      storeBanner: map['storeBanner'],
      gstNumber: map['gstNumber'],
      bankAccount: map['bankAccount'],
      isVerified: map['isVerified'] ?? false,
    );
  }
}

class User {
  final String id;
  final String name;
  final String email;
  final String password;
  final String address;
  final String type;
  final String token;
  final List<dynamic> cart;
  final SellerDetails? sellerDetails;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.address,
    required this.type,
    required this.token,
    required this.cart,
    this.sellerDetails,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'address': address,
      'type': type,
      'token': token,
      'cart': cart,
      'sellerDetails': sellerDetails?.toMap(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      address: map['address'] ?? '',
      type: map['type'] ?? '',
      token: map['token'] ?? '',
      cart: List<dynamic>.from(map['cart'] ?? []),
      sellerDetails: map['sellerDetails'] != null
          ? SellerDetails.fromMap(map['sellerDetails'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
