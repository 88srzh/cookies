import 'package:flutter/material.dart';

class Sweet extends ChangeNotifier {
  final String id;
  final int price;
  int likes;
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
  // final List<Color> colors;
  // final Color colors;
  final double rating;
  bool isFavourite;
  bool isPopular;

  Sweet({
    this.id,
    this.likes,
    this.images,
    // this.colors,
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

  void likeSweets() {
    this.isFavourite = !this.isFavourite;
    if (this.isFavourite) {
      this.likes += 1;
    } else {
      this.likes -= 1;
    }
  }

  // @override
  // int get hashCode => id;

  // getById(int id) => Sweets(id: id);

  // getByPosition(int position) {
  //   return getById(position);
}
// }

class Sweets with ChangeNotifier {
  List<Sweet> _allSweets = [
    Sweet(
      id: '1',
      images: 'assets/images/donut_pink_resize.png',
      // colors: [
      //   Color(0xFFF6625E),
      //   Color(0xFF836DB8),
      //   Color(0xFFDECB9C),
      //   Colors.white,
      // ],
      title: 'Красный вельвет',
      price: 65,
      likes: 0,
      description:
          '  Классическое лакомство. Это изделия в форме\n кольца, изготовленные из сладкого теста и\n хорошо поджаренные на высококачественном\n растительном масле.',
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
    Sweet(
      id: '2',
      images: 'assets/images/donut_chocolate.png',
      // colors: [
      //   Color(0xFFF6625E),
      //   Color(0xFF836DB8),
      //   Color(0xFFDECB9C),
      //   Colors.white,
      // ],
      title: 'Шоколадный',
      price: 75,
      likes: 0,
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
    Sweet(
      id: '3',
      images: 'assets/images/donut_coconut.png',
      // colors: [
      //   Color(0xFFF6625E),
      //   Color(0xFF836DB8),
      //   Color(0xFFDECB9C),
      //   Colors.white,
      // ],
      title: 'Ореховый',
      price: 85,
      likes: 0,
      description:
          '  Нежный ореховый мусс, хрустящий фундук в\nкарамели, пралине пекан, шоколадное песочное\nтесто, мороженое «Бельгийский шоколад\n с фундуком»',
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
    Sweet(
      id: '4',
      images: 'assets/images/doughnut_caramel.png',
      // colors: [
      //   Color(0xFFF6625E),
      //   Color(0xFF836DB8),
      //   Color(0xFFDECB9C),
      //   Colors.white,
      // ],
      title: 'Карамельный',
      price: 95,
      likes: 0,
      description:
          '  Свежие пончики с карамельной начинкой,\nпокрытые сахарной глазурью. Нежный вкус\nкарамели поможет ощутить тепло каждого момента\n',
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
    Sweet(
      id: '5',
      images: 'assets/images/donut_pink_resize.png',
      // colors: [
      //   Color(0xFFF6625E),
      //   Color(0xFF836DB8),
      //   Color(0xFFDECB9C),
      //   Colors.white,
      // ],
      title: 'Красный вельвет',
      price: 65,
      likes: 0,
      // description: description,
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
    Sweet(
      id: '6',
      images: 'assets/images/donut_pink_resize.png',
      // colors: [
      //   Color(0xFFF6625E),
      //   Color(0xFF836DB8),
      //   Color(0xFFDECB9C),
      //   Colors.white,
      // ],
      title: 'Красный вельвет',
      price: 65,
      likes: 0,
      // description: description,
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
  ];

  // List<Sweets> get allSweets => _allSweets;

  // set allSweets(List<Sweets> allSweets) {
  //   _allSweets = allSweets;
  // }

  // Sweets getById(int id) => Sweets(id);

  List<Sweet> get allSweets {
    return [..._allSweets];
  }

  Sweet findById(String id) {
    return _allSweets.firstWhere((sweet) => sweet.id == id);
  }

  // Sweets getByPosition(int position) {
  //   return getById(position);
  // }
}

// const String description =
//     'Самые вкусные печеньки для Вашего удовольствия. Попробуйте и убедитесь в этом сами.';
