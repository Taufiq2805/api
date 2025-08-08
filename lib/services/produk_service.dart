import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:xii_rpl_3/models/produk_model.dart';

class ProdukService {
  static const String baseUrl = 'https://dummyjson.com/products';

  // Fetch all products
  Future<ProdukModel?> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return ProdukModel.fromJson(jsonData);
      } else {
        print('Gagal mengambil produk. Status Code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Terjadi kesalahan saat mengambil produk: $e');
      return null;
    }
  }
}
