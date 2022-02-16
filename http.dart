import 'dart:convert';
import 'package:http/http.dart' as http;


///future void
Future<List> getProducts() async {
  var url = Uri.parse("http://10.0.11.35:8081/api/products");
  var response = await http.get(url);
  if (response.statusCode == 200) {
    return jsonDecode(utf8.decode(response.bodyBytes));
  } else {
    throw Exception("Erro ao carregar server");
  }
}
