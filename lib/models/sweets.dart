import 'package:flutter/material.dart';

class Sweet extends ChangeNotifier {
  final String id;
  final int price;
  int favoriteCount;
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
  bool isDonuts;
  bool isBurgers;

  Sweet({
    this.id,
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
    this.isDonuts = false,
    this.isBurgers = false,
  });

  // void likeSweets() {
  //   // this.isFavorite = !this.isFavorite;
  //   if (this.isFavorite) {
  //     this.favoriteCount += 1;
  //     isFavorite = false;
  //   } else {
  //     this.favoriteCount -= 1;
  //     isFavorite = true;
  //   }
  // }
}

class Sweets with ChangeNotifier {
  List<Sweet> _allSweets = [
    Sweet(
      categories: 'donuts',
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
      isDonuts: true,
      isBurgers: false,
    ),
    Sweet(
      categories: 'donuts',
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
      isDonuts: true,
      isBurgers: false,
    ),
    Sweet(
      categories: 'donuts',
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
      isDonuts: true,
      // isBurgers: false,
    ),
    Sweet(
      categories: 'donuts',
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
      isDonuts: true,
      // isBurgers: false,
    ),
    Sweet(
      categories: 'donuts',
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
      isDonuts: true,
      // isBurgers: false,
    ),
    Sweet(
      categories: 'donuts',
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
      isDonuts: true,
    ),
    Sweet(
      categories: 'burgers',
      id: '7',
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
      isDonuts: false,
      isBurgers: true,
    ),
    Sweet(
      categories: 'burgers',
      id: '8',
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
      isDonuts: false,
      isBurgers: true,
    ),
  ];

  List<Sweet> get allSweets {
    return [..._allSweets];
  }

  Sweet findById(String id) {
    return _allSweets.firstWhere((sweet) => sweet.id == id);
  }

  // ! - ?
  Sweet findByCategories(bool isDonuts) {
    return _allSweets.firstWhere((donut) => donut.isDonuts = isDonuts);
  }
}

// const String description =
//     'Самые вкусные печеньки для Вашего удовольствия. Попробуйте и убедитесь в этом сами.';
