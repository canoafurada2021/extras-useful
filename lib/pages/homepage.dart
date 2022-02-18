import 'package:flutter/material.dart';
import 'package:testes/pages/secondpage.dart';
import 'package:testes/widgets/busca.dart';

import '../http/http.dart';
import '../services/items_service.dart';
import '../widgets/carrinho.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        foregroundColor: Colors.black,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {},
          child: const Icon(
            Icons.format_list_bulleted,
            size: 30,
          ),
        ),
        title: const Text("Mais Vendidos"),
        bottom: const PreferredSize(
          child: Text(
            "Entrega em 80-90 min",
          ),
          preferredSize: Size.fromHeight(0),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const carrinhoPage()));
              },
              child: const Icon(
                Icons.shopping_cart,
                size: 30,
              ),
            ),
          )
        ],
      ),
      body: FutureBuilder<List<Items>>(
          future: getProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text("Error while loading products"),
              );
            }
            if (snapshot.hasData) {
              final List<Items> items = snapshot.data! as List<Items>;
              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final Items item = items[index];
                  print(" Index >>>>>>>>>> ${item.name}");
                  // final img = snapshot.data![index]["image"];
                  // final description = snapshot.data![index]["description"];
                  // final Items item = snapshot.data![index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      // backgroundImage: NetworkImage(snapshot.data![index]["image"]),
                    ),
                    title: Text(item.name),
                    trailing: SizedBox(child: Image.network(item.image, height: 100, width: 100,)),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => secondPage(item)));
                    },
                  );
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.wysiwyg), label: 'Historic'),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
        ],
      ),
    );
  }
}

