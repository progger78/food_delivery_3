import 'package:flutter/material.dart';
import 'package:food_delivery_3/controllers/cart_controller.dart';
import 'package:food_delivery_3/data/repository/popular_product_repo.dart';
import 'package:food_delivery_3/models/cart_model.dart';
import 'package:food_delivery_3/models/products_model.dart';
import 'package:food_delivery_3/utils/configurations.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;
  int _quantity = 0;
  int get quantity => _quantity;
  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;
  late CartController? _cart;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      print('got ur products man');
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    } else {}
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement == true) {
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  int checkQuantity(int quantity) {
    if ((_inCartItems + quantity) < 0) {
      Get.snackbar('Item count', 'You can\'t reduce more',
          backgroundColor: AppColors.mainColor, colorText: Colors.white);
      if (_inCartItems > 0) {
        _quantity = -_inCartItems;
        return _quantity;
      }
      return 0;
    } else if (_inCartItems + quantity > 15) {
      Get.snackbar('Item count', 'You can\'t add  more',
          backgroundColor: AppColors.mainColor, colorText: Colors.white);
      return 15;
    } else {
      return quantity;
    }
  }

  void initProduct(ProductModel product, CartController cart) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
    var exist = false;
    exist = _cart!.existsInCart(product);
    print('exist or not' + exist.toString());
    if (exist) {
      _inCartItems = _cart!.getQuantity(product);
      print('quantity is' + _inCartItems.toString());
    }
  }

  void addItem(ProductModel product) {
    _cart!.addItem(product, _quantity);

    _cart!.items.forEach((key, value) {
      print('product id is ${value.id}quantity is ${value.quantity}');
    });
    update();
  }

  int get totalItems {
    return _cart!.totalItems;
  }

  List<CartModel?> get getItems {
    return _cart!.getItems;
  }
}
