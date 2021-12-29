import 'package:flutter/cupertino.dart';
import 'package:getxshoppingapp/models/product.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  static var client = http.Client();

  static Future<List<Product>?> fecthProducts() async {
    //var response = await http.get(Uri.http('makeup-api.herokuapp.com','api/v1/products.json?brand=maybelline'));
    var response = await client.get(Uri.parse('https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'));
    if(response.statusCode == 200){
      var jsonString = response.body;
      debugPrint("Ürünler geldi");
      return productFromJson(jsonString);
    } else
      {
        debugPrint("İstek gerçeklesmedi");
      //Error message
        return null;
    }
  }
}
