import 'package:flutter/material.dart';
import 'package:news_app_c11_thursday/ui/home/categories_tab_widget/category_item.dart';

class CategoryDetailsWidget extends StatelessWidget {
  CategoryItem categoryItem;

  CategoryDetailsWidget({required this.categoryItem});

  @override
  Widget build(BuildContext context) {
    print(categoryItem.title);
    return Container(
      color: Colors.tealAccent,
    );
  }
}
