import 'package:flutter/material.dart';

class DietModel {
  String name;
  String imageUrl;
  String level;
  String duration;
  String calories;
  Color boxColor;
  bool viewIsSelected;

  DietModel({
    required this.name,
    required this.imageUrl,
    required this.level,
    required this.duration,
    required this.calories,
    required this.boxColor,
    required this.viewIsSelected
  });

  static List<DietModel> getDiets() {
    List<DietModel> diets = [];

    diets.add(DietModel(
      name: 'Salad',
      imageUrl: 'assets/icons/plate.svg',
      level: 'Beginner',
      duration: '30mins',
      calories: '200kcal',
      boxColor: Color(0xff92A3FD),
      viewIsSelected: false,
    ));

    diets.add(DietModel(
      name: 'Cake',
      imageUrl: 'assets/icons/pancakes.svg',
      level: 'Intermediate',
      duration: '1 hr',
      calories: '500kcal',
      boxColor: Color(0xffC58BF2),
      viewIsSelected: false,
    ));

    diets.add(DietModel(
      name: 'Pie',
      imageUrl: 'assets/icons/pie.svg',
      level: 'Advanced',
      duration: '2 hr',
      calories: '800kcal',
      boxColor: Color(0xff92A3FD),
      viewIsSelected: false,
    ));

    diets.add(DietModel(
      name: 'Smoothie',
      imageUrl: 'assets/icons/orange-snacks.svg',
      level: 'Beginner',
      duration: '15mins',
      calories: '150kcal',
      boxColor: Color.fromARGB(255, 243, 146, 199),
      viewIsSelected: false,
    ));

    return diets;
  }}