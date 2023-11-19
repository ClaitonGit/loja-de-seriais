import 'package:flutter/material.dart';
import 'package:gamekey/src/models/item_model.dart';

class PructDetalhe extends StatelessWidget {
  const PructDetalhe({
    Key? key,
    required this.item,
  }) : super(key: key);

  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Image.asset(item.imgUrl),
          ),
          Expanded(child: Container(
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(50),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.white38,
                  offset: Offset(0, 2),
                )
              ]
            ),
          ) ),
        ],
      ),
    );
  }
}
