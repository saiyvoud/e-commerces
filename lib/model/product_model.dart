class ProductModel {
  final String? id;
  final String? name;
  final String? desc;
  final int? amount;
  final int? price;
  final String? image;

  ProductModel({
    this.id,
    this.name,
    this.desc,
    this.amount,
    this.price,
    this.image,
  });
  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'],
        name: json['name'],
        desc: json['desc'],
        amount: json['amount'],
        price: json['price'],
        image: json['image'],
      );
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'desc': desc,
        'amount': amount,
        'price': price,
        'image': image,
      };
}
