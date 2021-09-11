import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pediprojflutter/constants/Constants.dart';
import 'package:pediprojflutter/constants/uiModels/card_model.dart';
import 'package:pediprojflutter/domain/models/product_model.dart';
import 'package:pediprojflutter/services/cart_service.dart';
import 'package:pediprojflutter/ui/components/card_list.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  CartService cart = CartService();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      cart = Provider.of<CartService>(context, listen: false);
    });
  }

  CardModel _formatterFunction(ProductModel item) {
    return CardModel(
      header: item.name,
      subHeader: item.description,
      buttonActionName: 'Remove',
      subHeader2: "\$${item.price}",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Constants.paddingHorizontal,
        vertical: Constants.paddingVertical,
      ),
      child: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.shopping_cart,
                  size: 32.0,
                  color: Theme.of(context).primaryColor.withOpacity(.8),
                ),
                SizedBox(width: 8.0),
                Text(
                  "Shopping Cart",
                  style: Theme.of(context).textTheme.headline1?.copyWith(
                        fontSize: 34.0,
                      ),
                ),
              ],
            ),
            SizedBox(
              height: 18.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Cart total: \$${cart.totalPrice}",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 21.0,
                  ),
                ),
                Text(
                  "Items: ${cart.items.length}",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 21.0,
                  ),
                ),
              ],
            ),
            CardList<ProductModel>(
              dataList: cart.items,
              formatterFunction: _formatterFunction,
              onButtonTapAction: (item) {
                cart.addItem(item);
              },
            ),
          ],
        ),
      ),
    );
  }
}
