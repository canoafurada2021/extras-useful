class Item {
  String name = '';
  int price = 0;
  String description = '';
  String image = '';


  Item(
      {required this.name, required this.price, required this.description, required this.image});


  Item.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    description = json['description'];
    image = json['image'];

  }



}