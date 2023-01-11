import 'package:hive_flutter/hive_flutter.dart';

part 'model_product.g.dart';

@HiveType(typeId: 1)
class Product {
  @HiveField(0)
  String? name;
  @HiveField(1)
  int? maxQty;
  @HiveField(2)
  dynamic price;
  @HiveField(3)
  String? timeId;
  @HiveField(4)
  int? inCartQty;

  Product({
    this.name,
    this.maxQty,
    this.price,
    this.timeId,
    this.inCartQty,
  });

  Product.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    maxQty = json['max_qty'];
    price = json['price'];
    timeId = json['time_id'];
    inCartQty = json['in_cart_qty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['max_qty'] = maxQty;
    data['price'] = price;
    data['time_id'] = timeId;
    data['in_cart_qty'] = inCartQty;
    return data;
  }
}
