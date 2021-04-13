class Donut {
  String key, title, rating, categories, price;

  Donut({this.key, this.title, this.rating, this.categories, this.price});

  Donut.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    title = json['title'];
    rating = json['rating'];
    categories = json['categories'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['title'] = this.title;
    data['rating'] = this.rating;
    data['categories'] = this.categories;
    data['price'] = this.price;
  }
}
