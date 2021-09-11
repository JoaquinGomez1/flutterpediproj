import 'package:pediprojflutter/domain/models/product_model.dart';

abstract class ICartService {
  addItem(ProductModel product) {}
  removeItem(int id) {}
  updateItem(ProductModel product, int id) {}
  clearCart() {}
}
