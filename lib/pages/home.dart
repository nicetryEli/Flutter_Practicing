import 'package:fitness/models/category_model.dart';
import 'package:fitness/models/diet_models.dart';
import 'package:fitness/models/popular_model.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];
  List<DietModel> diets = [];
  List<PopularDietsModel> popularDiets = [];

  void _getCategories() {
    categories = CategoryModel.getCategoryList();
  }

  void _getDiets() {
    diets = DietModel.getDiets();
  }

  void _getInitialInfo() {
    categories = CategoryModel.getCategoryList();
    diets = DietModel.getDiets();
    popularDiets = PopularDietsModel.getPopularDiets();
  }
  
  @override
  Widget build(BuildContext context) {
    _getInitialInfo();
    _getDiets();
    _getCategories();
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: ListView(
        
        children: [
          _searchField(),
          SizedBox(
            height: 40,
          ),
          _categoriesSection(),
          SizedBox(
            height: 40,
          ),
          _dietSection(),
          SizedBox(
            height: 40,
          ),
          _popularDietSection(),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }

  Column _popularDietSection() {
    return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                'Popular Diets',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              color: Colors.white,
              child: ListView.separated(
                clipBehavior: Clip.none,
                separatorBuilder: (context, index) => SizedBox(height: 25), 
                padding: EdgeInsets.only(left: 20, right: 20),
                itemCount: popularDiets.length,
                shrinkWrap: true,
                itemBuilder: (context, index){
                    return Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        // color: popularDiets[index].boxIsSelected ? Colors.white : Colors.transparent,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow:popularDiets[index].boxIsSelected ?  [
                          BoxShadow(
                            // ignore: deprecated_member_use
                            color: Colors.red.withOpacity(0.07),
                            spreadRadius: 0.0,
                            blurRadius: 40,
                            offset: Offset(0, 10), // changes position of shadow
                          ),
                        ] : []
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset(popularDiets[index].imageUrl,
                            height: 60,
                            width: 60,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                popularDiets[index].name,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                popularDiets[index].level + ' | ' + popularDiets[index].duration + ' | ' + popularDiets[index].calories,
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  // ignore: deprecated_member_use
                                  color: Colors.black.withOpacity(0.5),
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap:(){
                              
                            },
                          child: SvgPicture.asset('assets/icons/button.svg',
                            height: 30,
                            width: 30,
                          )
                          )
                        ]),
              
                    );
                },
                ),
            )
          ],
        );
  }

  Column _dietSection() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                'Recommendation\nfor Diet',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              color: Colors.white,
              height: 240,
              child: ListView.separated(
                padding: EdgeInsets.only(left: 20, right: 20),
                itemBuilder: (context, index) {
                  return Container(
                    height: 210,
                    width: 210,
                    decoration: BoxDecoration(
                      // ignore: deprecated_member_use
                      color: diets[index].boxColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: Center(
                            child: Column(
                              children: [
                                SvgPicture.asset(diets[index].imageUrl,
                                  height: 70,
                                  width: 70,
                                ),
                                Text(
                                  diets[index].name,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  diets[index].level + ' | ' + diets[index].duration + ' | ' + diets[index].calories,
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black.withOpacity(0.5),
                              ),
                            ),

                              ],
                            ),

                          ),
                        ),

                        Container(
                          height: 45,
                          width: 130,
                          child: Center(
                            child: Text(
                              'View',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: diets[index].viewIsSelected ? Colors.white : Color.fromARGB(255, 102, 168, 226),
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: 
                              [
                                diets[index].viewIsSelected ?  Color.fromARGB(255, 166, 209, 244) : Color.fromARGB(255, 4, 41, 105),
                                diets[index].viewIsSelected ?  Color.fromARGB(255, 90, 150, 255) : Color.fromARGB(255, 4, 41, 105),
                                ],
                            ),
                            borderRadius: BorderRadius.circular(50),
                          ),
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                  width: 25,
                ),
                itemCount: diets.length,
                scrollDirection: Axis.horizontal,
                ),
            )
          ],
        );
  }

  Column _categoriesSection() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Category',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 120,
              color: Colors.white,
              child: ListView.separated(
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 20, right: 20),
                separatorBuilder: (context, index) => SizedBox(
                  width: 20,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    height: 50,
                    width: 110,
                    decoration: BoxDecoration(
                      color: categories[index].boxColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset(
                                categories[index].imageUrl,
                                height: 50,
                                width: 50,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          categories[index].name,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        )
                      ],),
                  );
                },
              ),
            )
          ],
        );
  }

  Container _searchField() {
    return Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 40),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color(0x1Cf10167),
                spreadRadius: 0.0,
                blurRadius: 40,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ]
          ),
          child: TextField(
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              contentPadding: EdgeInsets.all(15),
              hintText: 'Search Pancake',
              hintStyle: TextStyle(
                fontSize: 14,
                color: Color(0xffDDDADA),
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset('assets/icons/Search.svg'),
              ),
              suffixIcon: SizedBox(
                width: 100,
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      VerticalDivider(
                        color: Colors.black,
                        indent: 10,
                        endIndent: 10,
                        thickness: 0.1,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset('assets/icons/Filter.svg'),
                      ),
                    ],
                  ),
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        );
  }

  AppBar appBar() {
    return AppBar(
    title: Text('Breakfast',
    style: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    
  ),
  backgroundColor: Colors.white,
  elevation: 0.0,
  centerTitle: true,
  leading: Container(
    margin: EdgeInsets.all(10),
    alignment: Alignment.center,
    height: 20,
    width: 20,
    decoration: BoxDecoration(
      color: Color(0xffF7F8F8),
      borderRadius: BorderRadius.circular(10),
    ),
    child: SvgPicture.asset(
    'assets/icons/Arrow - Left 2.svg'
    ),
  ),
  actions: [
  GestureDetector(
    onTap: () {
      // Add your action here
    },
    child: Container(
    margin: EdgeInsets.all(10),
    alignment: Alignment.center,
    height: 20,
    width: 37,
    decoration: BoxDecoration(
      color: Color(0xffF7F8F8),
      borderRadius: BorderRadius.circular(10),
    ),
    child: SvgPicture.asset(
    'assets/icons/dots.svg'
    ),
  ),
  ),
  ],
  );
  }
}