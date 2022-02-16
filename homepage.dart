import 'package:flutter/material.dart';
import 'http.dart';
import 'secondpage.dart';

///homePage Class
class homePage extends StatefulWidget {
  ///class contructor
  const homePage({Key? key}) : super(key: key);

  @override
  _homePageState createState() => _homePageState();
}

///class
class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Products',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Products'),
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
                        leading: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage: NetworkImage(
                            snapshot.data![index]["image"],
                          ),
                        ),
                        title: Text(snapshot.data![index]["name"]),
                        trailing: Text(snapshot.data![index]["category"]),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>  const secondPage()));
                        },
                      );
                    },
                  );
                }

                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              })),
    );
  }
}