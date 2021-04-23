class Item {
  String key, title, rating, categories, price, image;

  Item(
      {this.key,
      this.title,
      this.rating,
      this.categories,
      this.price,
      this.image});

  Item.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    title = json['title'];
    rating = json['rating'];
    categories = json['categories'];
    price = json['price'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['title'] = this.title;
    data['rating'] = this.rating;
    data['categories'] = this.categories;
    data['price'] = this.price;
    data['image'] = this.image;
  }
}
