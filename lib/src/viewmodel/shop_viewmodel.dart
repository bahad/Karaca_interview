import 'package:flutter/material.dart';
import 'package:trytiptop/src/model/shopping_model.dart';

class ShopProvider extends ChangeNotifier {
  List<ShoppingModel> _shopList = [];

  num _totalPrice = 0;

  List<ShoppingModel> get shopList => _shopList;
  num get totalPrice => _totalPrice;

  ShopProvider() {
    ShoppingModel();
  }

  addToList(ShoppingModel arr) {
    _shopList.add(arr);
    notifyListeners();
  }

  removeAll() {
    _shopList = [];
    notifyListeners();
  }

  calculateTotalPrice(num prc, int process // -1 se çıkarma 1 se toplama
      ) {
    if (process == -1) {
      _totalPrice = _totalPrice - prc;
    } else if (process == 1) {
      _totalPrice = _totalPrice + prc;
    }

    notifyListeners();
  }

  nullTotalPrice() {
    _totalPrice = 0;
    notifyListeners();
  }
}
