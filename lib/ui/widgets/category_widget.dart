import 'package:flutter/material.dart';
import 'package:news_app_c11_thursday/ui/home/categories_tab_widget/category_item.dart';

class CategoryWidget extends StatelessWidget {
  CategoryItem categoryItem;
  int index;

  CategoryWidget({required this.categoryItem, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: categoryItem.backgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
            bottomLeft: Radius.circular(index.isEven ? 25 : 0),
            bottomRight: Radius.circular(index.isEven ? 0 : 25),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            categoryItem.imagePath,
            width: 130,
            height: 115,
          ),
          Text(
            categoryItem.title,
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.w400, color: Colors.white),
          )
        ],
      ),
    );
  }
}
