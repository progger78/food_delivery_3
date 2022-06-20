import 'package:food_delivery_3/models/products_model.dart';

class CartModel {
  int? id;
  String? name;
  int? price;
  String? img;
  int? quantity;
  bool? isExist;
  String? time;
  ProductModel? product;

  CartModel({
    required this.id,
    required this.name,
    required this.isExist,
    required this.quantity,
    required this.price,
    required this.img,
    required this.time,
    required this.product
  });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    quantity = json['quantity'];
    price = json['price'];
    isExist = json['isExist'];
    img = json['img'];
    time = json['time'];
    product = ProductModel.fromJson(json['product']);
  }
}
