import 'package:pediprojflutter/domain/models/product_model.dart';
import 'package:pediprojflutter/domain/services/ICartService.dart';

class CartService implements ICartService {
  List<ProductModel> _items = [];
  double totalPrice = 0;

  List<ProductModel> get items => _items;

  @override
  addItem(ProductModel product) {
    items.add(product);
    totalPrice += product.price;
  }

  @override
  clearCart() {
    _items = [];
    totalPrice = 0;
  }

  @override
  removeItem(int id) {
    _items.removeWhere((element) => element.id == id);
  }

  @override
  updateItem(ProductModel product, int id) {
    throw UnimplementedError();
  }
}
