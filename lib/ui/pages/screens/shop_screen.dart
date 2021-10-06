import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pediprojflutter/constants/Constants.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Constants.paddingHorizontal,
          vertical: Constants.paddingVertical,
        ),
        child: Column(
          children: [
            _pageHeader(),
          ],
        ),
      ),
    );
  }

  _pageHeader() {
    return Row(
      children: [
        Icon(Icons.shop_2, color: Theme.of(context).primaryColor),
        SizedBox(
          width: 15,
        ),
        Text(
          "Shops",
          style: Theme.of(context).textTheme.headline1,
        ),
      ],
    );
  }
}
