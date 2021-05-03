class NewCart {
  String key, title, price, image;
  int quantity, totalQuantity;
  double totalPrice;

  NewCart({this.key, this.title, this.price, this.quantity, this.totalQuantity, this.totalPrice, this.image});

  NewCart.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    title = json['title'];
    price = json['price'].toString();
    image = json['image'];
    quantity = json['quantity'] as int;
    totalQuantity = json['totalQuantity'];
    totalPrice = double.parse(json['totalPrice'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['title'] = this.title;
    data['price'] = this.price.toString();
    data['image'] = this.image;
    data['quantity'] = this.quantity;
    data['totalQuantity'] = this.totalQuantity;
    data['totalPrice'] = this.totalPrice.toString();

    return data;
  }
}
