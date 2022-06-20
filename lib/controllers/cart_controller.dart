import 'package:food_delivery_3/data/repository/cart_repo.dart';
import 'package:food_delivery_3/models/products_model.dart';
import 'package:get/get.dart';

import '../models/cart_model.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;

  CartController({required this.cartRepo});
  final Map<int, CartModel> _items = {};
  Map<int, CartModel> get items => _items;
  void addItem(ProductModel product, int quantity) {
    var totalQuantity = 0;
    if (_items.containsKey(product.id)) {
      _items.update(
        product.id!,
        (value) {
          totalQuantity = value.quantity! + quantity;
          return CartModel(
              id: value.id,
              name: value.name,
              isExist: true,
              quantity: quantity + value.quantity!,
              price: value.price,
              img: value.img,
              time: DateTime.now().toString(),
              product: product);
        },
      );
      if (totalQuantity <= 0) {
        _items.remove(product.id);
      }
    } else {
      _items.putIfAbsent(
          product.id!,
          () => CartModel(
              id: product.id,
              name: product.name,
              isExist: true,
              quantity: quantity,
              price: product.price,
              img: product.img,
              time: DateTime.now().toString(),
              product: product));
    }
    update();
  }

  bool existsInCart(ProductModel product) {
    if (_items.containsKey(product.id)) {
      return true;
    } else {
      return false;
    }
  }

  int getQuantity(ProductModel product) {
    var quantity = 0;
    if (_items.containsKey(product.id)) {
      _items.forEach((key, value) {
        if (key == product.id) {
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }

  int get totalItems {
    var totalAmount = 0;
    _items.forEach((key, value) {
      totalAmount += value.quantity!;
    });
    return totalAmount;
  }

  List<CartModel> get getItems {
    return _items.entries.map((e) {
      return e.value;
    }).toList();
  }

  int get totalAmount {
    var totalAmount = 0;
    _items.forEach((key, value) {
      totalAmount += value.quantity! * value.price!;
    });
    return totalAmount;
  }
}
