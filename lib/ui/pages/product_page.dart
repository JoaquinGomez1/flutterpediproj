import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pediprojflutter/constants/Constants.dart';
import 'package:pediprojflutter/constants/uiModels/card_model.dart';

class ProductArguments {
  final CardModel card;

  ProductArguments(this.card);
}

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    final CardModel card =
        (ModalRoute.of(context)!.settings.arguments as CardModel);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(card.header),
      ),
      body: Container(
        width: double.infinity,
        color: Colors.white,
        padding: EdgeInsets.symmetric(
          vertical: Constants.paddingVertical,
          horizontal: Constants.paddingHorizontal,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeroImage(card),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(card.header, style: Theme.of(context).textTheme.headline1),
                Text(card.subHeader2 ?? "",
                    style: Theme.of(context).textTheme.headline6),
              ],
            )
          ],
        ),
      ),
    );
  }

  _buildHeroImage(CardModel card) {
    return Hero(
      tag: card.imageUrl ?? "asd",
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        child: Container(
          color: Colors.black.withOpacity(0.05),
          height: 300,
          child: Image(
            fit: BoxFit.contain,
            width: double.infinity,
            image: NetworkImage(card.imageUrl ?? ""),
          ),
        ),
      ),
    );
  }
}
