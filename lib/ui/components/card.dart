// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pediprojflutter/ui/models/card_model.dart';
import 'package:pediprojflutter/ui/components/custom_button.dart';
import 'package:pediprojflutter/ui/router.dart';

// ignore: file_names

class Card extends StatelessWidget {
  final double _cardHeight = 265;
  final dynamic Function() onButtonTap;
  final CardModel card;
  const Card(this.card, this.onButtonTap, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12.0),
      width: double
          .infinity, // makes this component stretch as far as the parent allows it to
      height: _cardHeight,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.05),
            offset: Offset(12, 10),
            spreadRadius: 1,
            blurRadius: 15,
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(
                15.0,
              ),
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushNamed(routesConfig["product"]!.route, arguments: card);
              },
              child: Hero(
                tag: card.imageUrl ?? "asd",
                child: Container(
                  height: _cardHeight / 2,
                  child: Image(
                    fit: BoxFit.cover,
                    width: double.infinity,
                    image: NetworkImage(card.imageUrl ?? ""),
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  this.card.header,
                  style: TextStyle(
                    fontSize: 21.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 4.0,
                ),
                Text(
                  this.card.subHeader,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(
                  height: 4.0,
                ),
                Text(this.card.subHeader2 ?? ""),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: CustomButton(
              actionName: card.buttonActionName,
              onPressed: onButtonTap,
            ),
          ),
        ],
      ),
    );
  }
}
