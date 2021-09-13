import 'package:flutter/cupertino.dart';
import 'package:pediprojflutter/domain/models/product_model.dart';
import 'package:pediprojflutter/domain/services/ICartService.dart';

class CartService with ChangeNotifier implements ICartService {
  List<ProductModel> _items = [];
  double totalPrice = 0;

  List<ProductModel> get items => _items;

  @override
  addItem(ProductModel product) {
    items.add(product);
    totalPrice += product.price;
    notifyListeners();
  }

  @override
  clearCart() {
    _items = [];
    totalPrice = 0;
    notifyListeners();
  }

  @override
  removeItem(int id) {
    ProductModel product = _items.firstWhere((element) => element.id == id);
    totalPrice -= product.price;
    _items.remove(product);

    notifyListeners();
  }

  @override
  updateItem(ProductModel product, int id) {
    throw UnimplementedError();
  }
}
