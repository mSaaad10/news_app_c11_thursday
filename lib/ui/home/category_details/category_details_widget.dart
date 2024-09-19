import 'package:flutter/material.dart';
import 'package:news_app_c11_thursday/api_manager/api_manager.dart';
import 'package:news_app_c11_thursday/api_manager/model/Sources.dart';
import 'package:news_app_c11_thursday/ui/home/categories_tab_widget/category_item.dart';
import 'package:news_app_c11_thursday/ui/home/category_details/sources_tabs.dart';

class CategoryDetailsWidget extends StatelessWidget {
  CategoryItem categoryItem;

  CategoryDetailsWidget({required this.categoryItem});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSources(categoryItem.categoryId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError || snapshot.data?.status == 'error') {
          Center(
            child: Column(
              children: [
                Text(snapshot.data?.message ?? snapshot.error.toString()),
                ElevatedButton(
                    onPressed: () {
                      // ToDo try again
                    },
                    child: Text('Try Again'))
              ],
            ),
          );
        }

        List<Sources> sources = snapshot.data?.sources ?? [];

        return SourcesTab(
          sourcesList: sources,
        );
      },
    );
  }
}
