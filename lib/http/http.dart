import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../services/items_service.dart';

Future<List<Items>> getProducts() async {
  var url = Uri.parse("http://10.0.11.35:8081/api/products");
  final Response response = await http.get(url);
  final List<dynamic> list = jsonDecode(response.body);
  final List<Items> items = [];

  for (Map<String,dynamic> element in list){
    final Items item = Items(name: element['name'], price: element['price'], description: element['description'], category: element['category'], image: element['image']);
    items.add(item);
  }
  return items;
  // if (response.statusCode == 200) {
  //   return list;
  // } else {
  //   throw Exception("Erro ao carregar server");
  // }

}


