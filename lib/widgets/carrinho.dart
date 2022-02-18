

import 'package:flutter/material.dart';

class carrinhoPage extends StatefulWidget {
  const carrinhoPage({Key? key}) : super(key: key);

  @override
  _carrinhoPageState createState() => _carrinhoPageState();
}

class _carrinhoPageState extends State<carrinhoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.white,
        height: 80,
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text('Total'),
          ],
        ),
      ),
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        foregroundColor: Colors.black,
        title: const Text("Carrinho"),
      ),
    );
  }
}
