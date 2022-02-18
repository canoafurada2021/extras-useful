import 'package:flutter/material.dart';

import '../http/http.dart';
import '../services/items_service.dart';

class secondPage extends StatefulWidget {
  final Items item;

  secondPage(this.item);

  @override
  _secondPageState createState() => _secondPageState(item);
}

class _secondPageState extends State<secondPage> {
  _secondPageState(this.item);

  final item;

  // Items item = widget.item;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        foregroundColor: Colors.black,
        title: const Text("Detalhes dos produtos"),
      ),
      body: ListTile(
        title: Text(widget.item.name),
        subtitle: Text(widget.item.description),
      ),
    );
  }
}
