import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Container(
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          child: SvgPicture.asset(
            'assets/icons/menu.svg',
            height: 15,
            width: 15,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),),
          actions: [
          GestureDetector(
            onTap: (){},
            child: Container(
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          child: SvgPicture.asset(
            'assets/icons/search.svg',
            height: 20,
            width: 20,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        SizedBox(width: 5),
          ),
          GestureDetector(
            onTap: (){},
          child: Container(
          margin: const EdgeInsets.all(10),
          width: 32,
          alignment: Alignment.center,
          child: SvgPicture.asset(
            'assets/icons/shop.svg',
            height: 23,
            width: 23,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),


          )
          ],
      ),
      );
      
  }
}