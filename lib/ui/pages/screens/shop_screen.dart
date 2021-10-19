import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pediprojflutter/constants/Constants.dart';
import 'package:pediprojflutter/constants/data/ui_data.dart';
import 'package:pediprojflutter/ui/models/card_model.dart';
import 'package:pediprojflutter/domain/models/shop_model.dart';
import 'package:pediprojflutter/ui/components/card.dart' as MyCard;

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
            _pageContent(shopsList),
          ],
        ),
      ),
    );
  }

  _pageContent(List<ShopModel> list) {
    return Expanded(
      child: Container(
        width: 400,
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: list.length,
          itemBuilder: (context, i) {
            ShopModel item = list[i];
            return MyCard.Card(
              CardModel(
                  header: item.name,
                  subHeader: item.description,
                  imageUrl: item.imageUrl),
              () {},
            );
          },
        ),
      ),
    );
  }

  _pageHeader() {
    return Column(
      children: [
        Row(
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
        ),
        SizedBox(
          height: 12.0,
        ),
        Wrap(children: const [
          Text(
            "Take a look at some of our favorite bars and restaurants",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          )
        ]),
        SizedBox(
          height: 12.0,
        ),
        Divider(color: Colors.black87),
      ],
    );
  }
}
