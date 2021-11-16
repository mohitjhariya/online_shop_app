import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> ctategoris = [
    "Hand bag",
    "Jewrllery",
    "Footwear",
    "Dresses",
    "Food"
  ];

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefultPaddig),
      child: SizedBox(
        height: 25,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: ctategoris.length,
            itemBuilder: (context, index) => buildCategory(index)),
      ),
    );
  }

  Widget buildCategory(int index) => GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefultPaddig),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ctategoris[index],
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color:
                        selectedIndex == index ? kTextColor : kTextlightColor),
              ),
              Container(
                height: 2,
                width: 30,
                color:
                    selectedIndex == index ? Colors.black : Colors.transparent,
              )
            ],
          ),
        ),
      );
}
