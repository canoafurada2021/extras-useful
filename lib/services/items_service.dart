import 'dart:convert';
import 'package:flutter/services.dart';


Future<String> _loadItemsJson() async{
  return await rootBundle.loadString('Json/items.json');
}
Future loadItems() async{
  String jsonString = await _loadItemsJson();
  final jsonResponse = json.decode(jsonString);
  Items items = Items.fromJson(jsonResponse);
  print(loadItems());

  return items;

}

class Items {
  String name;
  int price;
  String description;
  String category;
  String image;

  Items({
    this.name ='',
    this.price = 0,
    this.description = '',
    this.category = '',
    this.image = '',
  });
  factory Items.fromJson(Map<String,dynamic> parsedJson){
    return Items(
      name: parsedJson['name'],
      price: parsedJson['price'],
      description: parsedJson['description'],
      category: parsedJson['category'],
      image: parsedJson['image'],
    );
  }

}