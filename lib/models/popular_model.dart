import 'package:flutter/material.dart';

class PopularDietsModel {
  String name;
  String imageUrl;
  String level;
  String duration;
  String calories;
  Color boxColor;
  bool boxIsSelected;


PopularDietsModel({
    required this.name,
    required this.imageUrl,
    required this.level,
    required this.duration,
    required this.calories,
    required this.boxColor,
    required this.boxIsSelected
  });

  static List<PopularDietsModel> getPopularDiets() {
    List<PopularDietsModel> popularDiets = [];

    popularDiets.add(PopularDietsModel(
      name: 'Salad',
      imageUrl: 'assets/icons/plate.svg',
      level: 'Beginner',
      duration: '30mins',
      calories: '200kcal',
      boxColor: Color(0xff92A3FD),
      boxIsSelected: false,
    ));

    popularDiets.add(PopularDietsModel(
      name: 'Cake',
      imageUrl: 'assets/icons/pancakes.svg',
      level: 'Intermediate',
      duration: '1 hr',
      calories: '500kcal',
      boxColor: Color(0xffC58BF2),
      boxIsSelected: false,
    ));

    popularDiets.add(PopularDietsModel(
      name: 'Pie',
      imageUrl: 'assets/icons/pie.svg',
      level: 'Advanced',
      duration: '2 hr',
      calories: '800kcal',
      boxColor: Color(0xff92A3FD),
      boxIsSelected: false,
    ));

    popularDiets.add(PopularDietsModel(
      name: 'Smoothie',
      imageUrl: 'assets/icons/orange-snacks.svg',
      level: 'Beginner',
      duration: '15mins',
      calories: '150kcal',
      boxColor: Color.fromARGB(255, 243, 146, 199),
      boxIsSelected: false,
    ));

    return popularDiets;
  }
}