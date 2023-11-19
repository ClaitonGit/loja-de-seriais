import 'package:flutter/material.dart';
import 'package:gamekey/src/models/item_model.dart';
import 'package:gamekey/src/pages/product/productDesc.dart';
import 'package:gamekey/src/services/utils.dart';

class ItemTile extends StatelessWidget {
  final ItemModel item;

  ItemTile({
    Key? key,
    required this.item,
  }) : super(key: key);

  final UtilServices utilServices = UtilServices();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (c){
              return PructDetalhe(item: item,);
            }),);
          },
          child: Card(
            elevation: 1,
            shadowColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //imagem
                  Expanded(
                    child: Image.asset(item.imgUrl),
                  ),
                  // nome

                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      item.itemName,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),

                  //preço
                  Row(
                    children: [
                      Text(
                        utilServices.priceCurrence(item.preco),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),

        //Botão do carrinho
        Positioned(
          top: 4,
          right: 4,
          child: GestureDetector(
            onTap: (){

            },
            child: Container(
              height: 40,
              width: 35,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  topRight: Radius.circular(20),
                )
              ),
              child: const Icon(
                Icons.add_shopping_cart_outlined,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
