class ProdukModel {
  List<Produk>? products;

  ProdukModel({this.products});

  ProdukModel.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Produk>[];
      json['products'].forEach((v) {
        products!.add(Produk.fromJson(v));
      });
    }
  }
}

class Produk {
  int? id;
  String? title;
  double? price;
  double? rating;
  String? thumbnail;

  Produk({this.id, this.title, this.price, this.rating, this.thumbnail});

  Produk.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'].toDouble();
    rating = json['rating'].toDouble();
    thumbnail = json['thumbnail'];
  }
}
