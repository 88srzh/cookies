import 'package:flutter/material.dart';

class Sweets extends ChangeNotifier {
  final int id;
  final String title, description;
  final List<String> images;
  final List<Color> colors;
  final double rating, price;
  bool isFavourite, isPopular;

  Sweets({
    this.id,
    this.images,
    this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    this.title,
    this.price,
    this.description,
  });

  // getById(int id) => Sweets(id: id);

  // getByPosition(int position) {
  //   return getById(position);
}
// }

class CatalogModel {
  List<Sweets> allSweets = [
    Sweets(
      id: 1,
      images: [
        'assets/images/cookiemint.png',
        'assets/images/cookiechoco.png',
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      title: 'Печенька мятная',
      price: 64.99,
      description: description,
      rating: 4.8,
      isFavourite: true,
      isPopular: true,
    ),
    Sweets(
      id: 2,
      images: [
        'assets/images/cookiecream.png',
        'assets/images/cookieclassic.png',
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      title: 'Кремовая печенька',
      price: 54.99,
      description: description,
      rating: 4.1,
      isPopular: true,
    ),
    Sweets(
      id: 3,
      images: [
        'assets/images/cookieclassic.png',
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      title: 'Овсяная печенька',
      price: 35.99,
      description: description,
      rating: 4.4,
      isFavourite: true,
      isPopular: true,
    ),
    Sweets(
      id: 4,
      images: [
        'assets/images/cookiemint.png',
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      title: 'Кремовая печенька',
      price: 54.99,
      description: description,
      rating: 4.1,
      isFavourite: true,
    ),
  ];

  Sweets getById(int id) => Sweets(id: id);

  Sweets getByPosition(int position) {
    return getById(position);
  }
}

const String description =
    'Самые вкусные печеньки для Вашего удовольствия. Попробуйте и убедитесь в этом сами.';
