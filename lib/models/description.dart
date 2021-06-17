class DescriptionsItem {
  String key,
      title,
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

  DescriptionsItem(
      {this.key,
      this.title,
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

  DescriptionsItem.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    title = json['title'];
    // price may be to String
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['title'] = this.title;
    data['price'] = this.price;
    data['image'] = this.image;
    data['description'] = this.description;
    data['sugar'] = this.sugar;
    data['fat'] = this.fat;
    data['energy'] = this.energy;
    data['salt'] = this.salt;
    data['energyGram'] = this.energyGram;
    data['sugarGram'] = this.sugarGram;
    data['saltGram'] = this.saltGram;
    data['fatGram'] = this.fatGram;

    return data;
  }
}
