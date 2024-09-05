import 'package:flutter/material.dart';
import 'package:news_app_c11_thursday/ui/home/categories_tab_widget/category_item.dart';
import 'package:news_app_c11_thursday/ui/widgets/category_widget.dart';

typedef OnCategoryItemClicked = void Function(CategoryItem category);

class CategoriesTab extends StatelessWidget {
  OnCategoryItemClicked onCategoryItemClicked;

  CategoriesTab({required this.onCategoryItemClicked});

  List<CategoryItem> catList = CategoryItem.getCategoriesList();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18),
      child: Column(
        children: [
          Text('Pick your category\nof interest',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Color(0xFF4F5A69),
              )),
          Expanded(
              child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12),
            itemBuilder: (context, index) => InkWell(
                onTap: () {
                  onCategoryItemClicked(catList[index]);
                },
                child: CategoryWidget(
                  categoryItem: catList[index],
                  index: index,
                )),
            itemCount: catList.length,
          ))
        ],
      ),
    );
  }
}
