import 'package:flutter/material.dart';

class Sweets extends ChangeNotifier {
  final int id, price;
  final String title, description;
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
    ),
  ];

  Sweets getById(int id) => Sweets(id);

  Sweets getByPosition(int position) {
    return getById(position);
  }
}

const String description =
    'Самые вкусные печеньки для Вашего удовольствия. Попробуйте и убедитесь в этом сами.';
