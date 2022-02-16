import 'package:flutter/material.dart';
import 'package:testes/items.dart';

class GridProdutos extends StatelessWidget {
  final Function atualiza;
  final  item;

  GridProdutos({this.item,required this.atualiza});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: item.length,
      itemBuilder: (BuildContext context, int indice) {
        //final item = Item.fromJson(item[indice]);
        return  GridProdutos(
          //Item: item,
          atualiza: atualiza,
        );
      },
    );
  }
}
