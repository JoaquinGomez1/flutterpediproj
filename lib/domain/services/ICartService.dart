import 'package:flutter/widgets.dart';
import 'package:pediprojflutter/domain/models/product_model.dart';

abstract class ICartService extends ChangeNotifier {
  addItem(ProductModel product) {}
  removeItem(int id) {}
  updateItem(ProductModel product, int id) {}
  clearCart() {}
}
