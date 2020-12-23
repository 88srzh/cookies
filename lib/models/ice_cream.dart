import 'package:flutter/material.dart';

class IceCream {
  final int id;
  final String title, description;
  final List<String> images;
  final List<Color> colors;
  final double rating, price;
  bool isFavourite, isPopular;

  IceCream({
    this.id,
    @required this.images,
    @required this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    @required this.title,
    @required this.price,
    @required this.description,
  });
}

List<IceCream> allIceCream = [
  IceCream(
    id: 1,
    images: [
      'assets/images/icecreamcherrycordial.png',
      'assets/images/icecreampeppermint.png',
      'assets/images/icecreampink.png',
      'assets/images/icecreampinksecond.png',
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: 'Мятное мороженое',
    price: 64.99,
    description: description,
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  IceCream(
    id: 2,
    images: [
      'assets/images/icecreampinksecond.png',
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: 'Розовая морожка',
    price: 54.99,
    description: description,
    rating: 4.1,
    isPopular: true,
  ),
  IceCream(
    id: 3,
    images: [
      'assets/images/icecreampink.png',
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: 'Мятное мороженое',
    price: 35.99,
    description: description,
    rating: 4.4,
    isFavourite: true,
    isPopular: true,
  ),
  IceCream(
    id: 4,
    images: [
      'assets/images/icecreampeppermint.png',
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: 'Мятное мороженое',
    price: 54.99,
    description: description,
    rating: 4.1,
    isFavourite: true,
  ),
  IceCream(
    id: 5,
    images: [
      'assets/images/icecreampeppermint.png',
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: 'Мятное мороженое',
    price: 54.99,
    description: description,
    rating: 4.1,
    isFavourite: true,
  ),
  IceCream(
    id: 6,
    images: [
      'assets/images/icecreampeppermint.png',
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: 'Мятное мороженое',
    price: 54.99,
    description: description,
    rating: 4.1,
    isFavourite: true,
  ),
  IceCream(
    id: 7,
    images: [
      'assets/images/icecreampeppermint.png',
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: 'Мятное мороженое',
    price: 54.99,
    description: description,
    rating: 4.1,
    isFavourite: true,
  ),
  IceCream(
    id: 8,
    images: [
      'assets/images/icecreampeppermint.png',
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: 'Мятное мороженое',
    price: 54.99,
    description: description,
    rating: 4.1,
    isFavourite: true,
  ),
  IceCream(
    id: 9,
    images: [
      'assets/images/icecreampeppermint.png',
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: 'Мятное мороженое',
    price: 54.99,
    description: description,
    rating: 4.1,
    isFavourite: true,
  ),
  IceCream(
    id: 10,
    images: [
      'assets/images/icecreampeppermint.png',
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: 'Мятное мороженое',
    price: 54.99,
    description: description,
    rating: 4.1,
    isFavourite: true,
  ),
];

const String description =
    'Самые вкусные печеньки для Вашего удовольствия. Попробуйте и убедитесь в этом сами.';
