import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: TextFormField(
            decoration: const  InputDecoration(
              hintText: "Pesquisar"
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height - 200,
          child: ListView(
            children: const [
              ListTile(
                leading: Icon(Icons.adjust),
                title: Text("Nome do item"),
              )
            ],
          ),
        )
      ],
    );
  }
}
