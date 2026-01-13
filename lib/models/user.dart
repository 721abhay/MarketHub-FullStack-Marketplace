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
  final List<dynamic> recentlyViewed;
  final List<dynamic> wishlist;
  final double wallet;
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
    required this.recentlyViewed,
    required this.wishlist,
    required this.wallet,
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
      'recentlyViewed': recentlyViewed,
      'wishlist': wishlist,
      'wallet': wallet,
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
      recentlyViewed: List<dynamic>.from(map['recentlyViewed'] ?? []),
      wishlist: List<dynamic>.from(map['wishlist'] ?? []),
      wallet: (map['wallet'] ?? 0).toDouble(),
      sellerDetails: map['sellerDetails'] != null
          ? SellerDetails.fromMap(map['sellerDetails'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    String? address,
    String? type,
    String? token,
    List<dynamic>? cart,
    List<dynamic>? recentlyViewed,
    List<dynamic>? wishlist,
    double? wallet,
    SellerDetails? sellerDetails,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      address: address ?? this.address,
      type: type ?? this.type,
      token: token ?? this.token,
      cart: cart ?? this.cart,
      recentlyViewed: recentlyViewed ?? this.recentlyViewed,
      wishlist: wishlist ?? this.wishlist,
      wallet: wallet ?? this.wallet,
      sellerDetails: sellerDetails ?? this.sellerDetails,
    );
  }
}
