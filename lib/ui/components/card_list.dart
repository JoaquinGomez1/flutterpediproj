import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pediprojflutter/constants/uiModels/card_model.dart';

import 'card.dart' as mycard;

class CardList<T> extends StatefulWidget {
  final List<T> dataList;
  final CardModel Function(T data) formatterFunction;
  final void Function(T item) onButtonTapAction;
  const CardList({
    Key? key,
    required this.dataList,
    required this.onButtonTapAction,
    required this.formatterFunction,
  }) : super(key: key);

  @override
  _CardListState createState() => _CardListState<T>();
}

class _CardListState<T> extends State<CardList<T>> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        child: ListView.builder(
          itemCount: widget.dataList.length,
          itemBuilder: (context, i) {
            T item = widget.dataList[i];
            CardModel card = widget.formatterFunction(item);
            return mycard.Card(
              card,
              () => widget.onButtonTapAction(item),
            );
          },
        ),
      ),
    );
  }
}
