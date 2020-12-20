import 'package:cookie/screens/categories/components/body_categories.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  static String routeName = '/categories';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Категории'),
      ),
      body: BodyCategories(),
    );
  }
}
