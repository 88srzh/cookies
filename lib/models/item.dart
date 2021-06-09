class Item {
  String key,
      title,
      categories,
      price,
      image,
      description,
      sugar,
      fat,
      energy,
      salt,
      energyGram,
      sugarGram,
      saltGram,
      fatGram;
  int favoriteCount;
  bool isFavorite = false;
  double rating;

  Item (
      {this.key,
      this.title,
      this.favoriteCount,
      this.rating,
      this.categories,
      this.price,
      this.image,
      this.description,
      this.sugar,
      this.fat,
      this.energy,
      this.salt,
      this.energyGram,
      this.sugarGram,
      this.saltGram,
      this.fatGram});

  Item.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    title = json['title'];
    isFavorite = json['isFavorite'];
    rating = double.parse(json['rating'].toString());
    favoriteCount = json['favorite'] as int;
    categories = json['categories'];
    price = json['price'];
    image = json['image'];
    description = json['description'];
    sugar = json['sugar'];
    fat = json['fat'];
    energy = json['energy'];
    salt = json['salt'];
    energyGram = json['energyGram'];
    sugarGram = json['sugarGram'];
    saltGram = json['saltGram'];
    fatGram = json['fatGram'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> itemData = new Map<String, dynamic>();
    itemData['key'] = this.key;
    itemData['title'] = this.title;
    itemData['isFavorite'] = this.isFavorite;
    itemData['rating'] = this.rating.toString();
    itemData['favorite'] = this.favoriteCount;
    itemData['categories'] = this.categories;
    itemData['price'] = this.price;
    itemData['image'] = this.image;
    itemData['description'] = this.description;
    itemData['sugar'] = this.sugar;
    itemData['fat'] = this.fat;
    itemData['energy'] = this.energy;
    itemData['salt'] = this.salt;
    itemData['energyGram'] = this.energyGram;
    itemData['sugarGram'] = this.sugarGram;
    itemData['saltGram'] = this.saltGram;
    itemData['fatGram'] = this.fatGram;

    return itemData;
  }
}
