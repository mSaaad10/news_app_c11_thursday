import 'package:flutter/material.dart';
import 'package:news_app_c11_thursday/ui/home/categories_tab_widget/categories_tab.dart';
import 'package:news_app_c11_thursday/ui/home/categories_tab_widget/category_item.dart';
import 'package:news_app_c11_thursday/ui/home/category_details/category_details_widget.dart';
import 'package:news_app_c11_thursday/ui/home/home_drawer/home_drawer.dart';
import 'package:news_app_c11_thursday/ui/home/settings_tab_widget/settings_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedWidget =
        CategoriesTab(onCategoryItemClicked: onCategoryItemClicked);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image:
              DecorationImage(image: AssetImage('assets/images/pattern.png'))),
      child: Scaffold(
          appBar: AppBar(
            title: Text('News App'),
          ),
          drawer: HomeDrawer(onMenuItemClicked: onMenuItemClicked),
          body: selectedWidget),
    );
  }

  late Widget selectedWidget;

  void onMenuItemClicked(MenuItem item) {
    switch (item) {
      case MenuItem.categories:
        {
          selectedWidget = CategoriesTab(
            onCategoryItemClicked: onCategoryItemClicked,
          );
        }
      case MenuItem.settings:
        {
          selectedWidget = SettingsTab();
        }

      //
    }
    Navigator.pop(context);
    setState(() {});
  }

  void onCategoryItemClicked(CategoryItem catItem) {
    selectedWidget = CategoryDetailsWidget(categoryItem: catItem);
    setState(() {});
  }
}
