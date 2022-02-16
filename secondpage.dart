import 'package:flutter/material.dart';
import 'package:testes/http.dart';




///stateless widget class
class secondPage extends StatelessWidget {
  ///constructor
  const secondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Details"),
        ),
        body: FutureBuilder<List>(
            future: getProducts(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text("Error while loading products"),
                );
              }
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(snapshot.data![index]["name"]),
                        subtitle: Text(snapshot.data![index]["description"]),
                      );
                    });
              }
              return const CircularProgressIndicator();
            }
        )
    );
  }
}