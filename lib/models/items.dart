import 'package:flutter/material.dart';

class Items extends ChangeNotifier {
  final String id;
  final int price;
  final int uid;
  int favoriteCount = 0;
  int totalFavoriteCount = 0;
  final String title;
  final String description;
  final String sugar;
  final String fat;
  final String energy;
  final String salt;
  final String energyGramm;
  final String sugarGramm;
  final String saltGramm;
  final String fatGramm;
  final String images;
  final String categories;
  final double rating;
  bool isFavorite;
  bool isPopular;

  Items({
    this.id,
    this.uid,
    this.favoriteCount,
    this.images,
    this.rating = 0.0,
    this.isFavorite = false,
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
    this.categories,
  });
}

class Sweets with ChangeNotifier {
  List<Items> _allSweets = [
    Items(
      uid: 1,
      categories: 'Данкины',
      id: '1',
      images: 'assets/images/donut_pink_resize.png',
      title: 'Красный вельвет',
      price: 65,
      favoriteCount: 0,
      description:
          '  Классическое лакомство. Это изделия в форме\n кольца, изготовленные из сладкого теста и\n хорошо поджаренные на высококачественном\n растительном масле.',
      rating: 4.8,
      isFavorite: false,
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
    Items(
      uid: 2,
      categories: 'Данкины',
      id: '2',
      images: 'assets/images/donut_chocolate.png',
      title: 'Шоколадный',
      price: 75,
      favoriteCount: 0,
      description:
          '  Красивые ароматные пончики из особого теста\n с добавлением какао-порошка\n\n',
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
    Items(
      uid: 3,
      categories: 'Данкины',
      id: '3',
      images: 'assets/images/donut_coconut.png',
      title: 'Ореховый',
      price: 85,
      favoriteCount: 0,
      description:
          '  Нежный ореховый мусс, хрустящий фундук в\nкарамели, пралине пекан, шоколадное песочное\nтесто, мороженое «Бельгийский шоколад\n с фундуком»',
      rating: 4.4,
      isFavorite: false,
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
    Items(
      uid: 4,
      categories: 'Данкины',
      id: '4',
      images: 'assets/images/doughnut_caramel.png',
      title: 'Карамельный',
      price: 95,
      favoriteCount: 0,
      description:
          '  Свежие пончики с карамельной начинкой,\nпокрытые сахарной глазурью. Нежный вкус\nкарамели поможет ощутить тепло каждого момента\n',
      rating: 4.1,
      isFavorite: false,
      sugar: '4',
      salt: '0.2',
      fat: '15',
      energy: '45',
      sugarGramm: '11 грамм',
      saltGramm: '6 грамм',
      fatGramm: '11 грамм',
      energyGramm: '180 Ккал',
    ),
    Items(
      uid: 5,
      categories: 'Данкины',
      id: '5',
      images: 'assets/images/donut_pink_resize.png',
      title: 'Красный вельвет',
      price: 65,
      favoriteCount: 0,
      description: '  Оригинальный пончик',
      rating: 4.8,
      isFavorite: false,
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
    Items(
      uid: 6,
      categories: 'Данкины',
      id: '6',
      images: 'assets/images/donut_pink_resize.png',
      title: 'Красный вельвет',
      price: 65,
      favoriteCount: 0,
      description: 'Тоже оригинальный',
      rating: 4.8,
      isFavorite: false,
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
  ];

  List<Items> _allBurgers = [
    Items(
      uid: 11,
      categories: 'Бургеры',
      id: '10',
      images: 'assets/images/chiken_burger.png',
      title: 'Сочная курочка',
      price: 125,
      favoriteCount: 0,
      description:
          '  Куриный бургер — отличная альтернатива\nобычному: благодаря птице, а не мясу в составе\nкотлеты блюдо получается более легким и нежным',
      rating: 4.8,
      isFavorite: false,
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
    Items(
      uid: 12,
      categories: 'Бургеры',
      id: '12',
      images: 'assets/images/meat_burger.png',
      title: 'Мясной',
      price: 65,
      favoriteCount: 0,
      description: 'Мясной бургер.',
      rating: 4.8,
      isFavorite: false,
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
    Items(
      uid: 13,
      categories: 'Бургеры',
      id: '13',
      images: 'assets/images/meat_burger.png',
      title: 'Мясной',
      price: 65,
      favoriteCount: 0,
      description: 'Мясной бургер.',
      rating: 4.8,
      isFavorite: false,
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
    Items(
      uid: 14,
      categories: 'Бургеры',
      id: '14',
      images: 'assets/images/meat_burger.png',
      title: 'Мясной',
      price: 65,
      favoriteCount: 0,
      description: 'Мясной бургер.',
      rating: 4.8,
      isFavorite: false,
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
    Items(
      uid: 15,
      categories: 'Бургеры',
      id: '15',
      images: 'assets/images/meat_burger.png',
      title: 'Мясной',
      price: 65,
      favoriteCount: 0,
      description: 'Мясной бургер.',
      rating: 4.8,
      isFavorite: false,
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
    Items(
      uid: 16,
      categories: 'Бургеры',
      id: '16',
      images: 'assets/images/meat_burger.png',
      title: 'Мясной',
      price: 65,
      favoriteCount: 0,
      description: 'Мясной бургер.',
      rating: 4.8,
      isFavorite: false,
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
    Items(
      uid: 17,
      categories: 'Бургеры',
      id: '17',
      images: 'assets/images/meat_burger.png',
      title: 'Мясной',
      price: 65,
      favoriteCount: 0,
      description: 'Мясной бургер.',
      rating: 4.8,
      isFavorite: false,
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
  ];

  List<Items> get allBurgers {
    return [..._allBurgers];
  }

  Items findByIdBurgers(String id) {
    return _allBurgers.firstWhere((burger) => burger.id == id);
  }

  List<Items> get allSweets {
    return [..._allSweets];
  }

  Items findById(String id) {
    return _allSweets.firstWhere((sweet) => sweet.id == id);
  }
}

// const String description =
//     'Самые вкусные печеньки для Вашего удовольствия. Попробуйте и убедитесь в этом сами.';
