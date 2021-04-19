class NewCart {
  String key, title, price, image;
  int quantity;
  double totalPrice;

  NewCart(
      {this.key,
      this.title,
      this.price,
      this.quantity,
      this.totalPrice,
      this.image});

  NewCart.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    title = json['title'];
    price = json['price'].toString();
    image = json['image'];
    quantity = json['quantity'] as int;
    totalPrice = double.parse(json['totalPrice'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['title'] = this.title;
    data['price'] = this.price.toString();
    data['image'] = this.image;
    data['quantity'] = this.quantity;
    data['totalPrice'] = this.totalPrice.toString();

    return data;
  }
}
