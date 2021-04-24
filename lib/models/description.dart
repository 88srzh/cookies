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
      energyGramm,
      sugarGramm,
      saltGramm,
      fatGramm;

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
      this.energyGramm,
      this.sugarGramm,
      this.saltGramm,
      this.fatGramm});

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
    energyGramm = json['energyGramm'];
    sugarGramm = json['sugarGramm'];
    saltGramm = json['saltGramm'];
    fatGramm = json['fatGramm'];
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
    data['energyGramm'] = this.energyGramm;
    data['sugarGramm'] = this.sugarGramm;
    data['saltGramm'] = this.saltGramm;
    data['fatGramm'] = this.fatGramm;

    return data;
  }
}
