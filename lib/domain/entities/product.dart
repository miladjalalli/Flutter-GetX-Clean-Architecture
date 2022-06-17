class Product {
  Product({this.name});

  String? name;

  factory Product.fromJson(Map<String, dynamic>? json) {
    return Product(
      name: json?['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
      };
}
