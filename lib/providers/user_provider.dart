import 'package:amazon_clone/models/product.dart';
import 'package:amazon_clone/models/user.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
    id: '',
    name: '',
    email: '',
    password: '',
    address: '',
    type: '',
    token: '',
    cart: [],
    sellerDetails: null,
  );

  User get user => _user;

  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }

  void signOut() {
    _user = User(
      id: '',
      name: '',
      email: '',
      password: '',
      address: '',
      type: '',
      token: '',
      cart: [],
      sellerDetails: null,
    );
    notifyListeners();
  }

  void setUserFromModel(User user) {
    _user = user;
    notifyListeners();
  }

  void addToCart(Product product) {
    final List<dynamic> updatedCart = List.from(_user.cart);
    bool isFound = false;
    for (int i = 0; i < updatedCart.length; i++) {
      if (updatedCart[i]['product']['_id'] == product.id || updatedCart[i]['product']['id'] == product.id) {
        updatedCart[i]['quantity'] += 1;
        isFound = true;
        break;
      }
    }
    if (!isFound) {
      updatedCart.add({'product': product.toMap(), 'quantity': 1});
    }
    _user = _user.copyWith(cart: updatedCart);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    final List<dynamic> updatedCart = List.from(_user.cart);
    for (int i = 0; i < updatedCart.length; i++) {
      if (updatedCart[i]['product']['_id'] == product.id || updatedCart[i]['product']['id'] == product.id) {
        if (updatedCart[i]['quantity'] > 1) {
          updatedCart[i]['quantity'] -= 1;
        } else {
          updatedCart.removeAt(i);
        }
        break;
      }
    }
    _user = _user.copyWith(cart: updatedCart);
    notifyListeners();
  }

  void clearCart() {
    _user = _user.copyWith(cart: []);
    notifyListeners();
  }
}

extension UserCopyWith on User {
  User copyWith({
    List<dynamic>? cart,
    String? type,
    SellerDetails? sellerDetails,
  }) {
    return User(
      id: id,
      name: name,
      email: email,
      password: password,
      address: address,
      type: type ?? this.type,
      token: token,
      cart: cart ?? this.cart,
      sellerDetails: sellerDetails ?? this.sellerDetails,
    );
  }
}
