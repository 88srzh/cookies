import 'package:flutter/material.dart';

class Sweets extends ChangeNotifier {
  final int id, price;
  final String title,
      description,
      sugar,
      fat,
      energy,
      salt,
      energyGramm,
      sugarGramm,
      saltGramm,
      fatGramm;
  final List<String> images;
  final List<Color> colors;
  final double rating;
  bool isFavourite, isPopular;

  Sweets(
    this.id, {
    this.images,
    this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    this.title,
    this.price,
    this.description,
    this.sugar,
    this.salt,
    this.fat,
    this.energy,
    this.sugarGramm,
    this.saltGramm,
    this.fatGramm,
    this.energyGramm,
  });

  @override
  int get hashCode => id;

  // getById(int id) => Sweets(id: id);

  // getByPosition(int position) {
  //   return getById(position);
}
// }

class CatalogModel {
  List<Sweets> allSweets = [
    Sweets(
      1,
      images: [
        'assets/images/donut_pink_resize.png',
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      title: 'Красный вельвет',
      price: 65,
      description: description,
      rating: 4.8,
      isFavourite: true,
      isPopular: true,
      sugar: '2',
      salt: '0.3',
      fat: '12',
      energy: '40',
      sugarGramm: '8 грамм',
      saltGramm: '8 грамм',
      fatGramm: '8 грамм',
      energyGramm: '140 Ккал',
    ),
    Sweets(
      2,
      images: [
        'assets/images/donut_chocolate.png',
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      title: 'Шоколадный',
      price: 75,
      description: description,
      rating: 4.1,
      isPopular: true,
      sugar: '4',
      salt: '0.3',
      fat: '15',
      energy: '45',
      sugarGramm: '10 грамм',
      saltGramm: '9 грамм',
      fatGramm: '9 грамм',
      energyGramm: '200 Ккал',
    ),
    Sweets(
      3,
      images: [
        'assets/images/donut_coconut.png',
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      title: 'Ореховый',
      price: 85,
      description: description,
      rating: 4.4,
      isFavourite: true,
      isPopular: true,
      sugar: '2',
      salt: '0.2',
      fat: '14',
      energy: '40',
      sugarGramm: '7 грамм',
      saltGramm: '9 грамм',
      fatGramm: '6 грамм',
      energyGramm: '175 Ккал',
    ),
    Sweets(
      4,
      images: [
        'assets/images/doughnut_caramel.png',
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      title: 'Карамельный',
      price: 95,
      description: description,
      rating: 4.1,
      isFavourite: true,
      sugar: '4',
      salt: '0.2',
      fat: '15',
      energy: '45',
      sugarGramm: '11 грамм',
      saltGramm: '6 грамм',
      fatGramm: '11 грамм',
      energyGramm: '180 Ккал',
    ),
  ];

  Sweets getById(int id) => Sweets(id);

  Sweets getByPosition(int position) {
    return getById(position);
  }
}

const String description =
    'Самые вкусные печеньки для Вашего удовольствия. Попробуйте и убедитесь в этом сами.';
