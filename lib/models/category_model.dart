import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String imageUrl;
  Color boxColor;

  CategoryModel({
    required this.name,
    required this.imageUrl,
    required this.boxColor,
  });

  static List<CategoryModel> getCategoryList() {
    List<CategoryModel> categories = [];

    categories.add(CategoryModel(
      name: 'Salad',
      imageUrl: 'assets/icons/plate.svg',
      boxColor: Color(0xff92A3FD),
    )
    );

    categories.add(CategoryModel(
      name: 'Cake',
      imageUrl: 'assets/icons/pancakes.svg',
      boxColor: Color(0xffC58BF2),
    )
    );

    categories.add(CategoryModel(
      name: 'Pie',
      imageUrl: 'assets/icons/pie.svg',
      boxColor: Color(0xff92A3FD),
    )
    );

    categories.add(CategoryModel(
      name: 'Smoothie',
      imageUrl: 'assets/icons/orange-snacks.svg',
      boxColor: Color.fromARGB(255, 243, 146, 199),
    )
    );

    return categories;
  }
}