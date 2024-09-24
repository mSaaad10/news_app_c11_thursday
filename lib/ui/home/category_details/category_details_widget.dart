import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_c11_thursday/data/api_manager/model/sources_response/Sources.dart';
import 'package:news_app_c11_thursday/ui/home/categories_tab_widget/category_item.dart';
import 'package:news_app_c11_thursday/ui/home/category_details/category_details_viewModel.dart';
import 'package:news_app_c11_thursday/ui/home/category_details/sources_tabs.dart';

class CategoryDetailsWidget extends StatefulWidget {
  CategoryItem categoryItem;

  CategoryDetailsWidget({required this.categoryItem});

  @override
  State<CategoryDetailsWidget> createState() => _CategoryDetailsWidgetState();
}

class _CategoryDetailsWidgetState extends State<CategoryDetailsWidget> {
  CategoryDetailsViewModel viewModel = CategoryDetailsViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSourcesList(widget.categoryItem.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryDetailsViewModel, CategoryDetailsState>(
      bloc: viewModel,
      builder: (context, state) {
        switch (state) {
          case LoadingState():
            {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          case ErrorState():
            {
              return Center(
                child: Column(
                  children: [
                    Text(state.errorMessage ?? ''),
                    ElevatedButton(
                        onPressed: () {
                          // ToDo try again
                        },
                        child: Text('Try Again'))
                  ],
                ),
              );
            }
          case SuccessState():
            {
              List<Source> sources = state.sourcesList ?? [];

              return SourcesTab(
                sourcesList: sources,
              );
            }
        }
      },
    );

//     return FutureBuilder(
//       future: ApiManager.getSources(categoryItem.categoryId),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           print('hello im waiting');
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//         if (snapshot.hasError || snapshot.data?.status == 'error') {
//           Center(
//             child: Column(
//               children: [
//                 Text(snapshot.data?.message ?? snapshot.error.toString()),
//                 ElevatedButton(
//                     onPressed: () {
//                       // ToDo try again
//                     },
//                     child: Text('Try Again'))
//               ],
//             ),
//           );
//         }
// print(snapshot.data?.sources![0].name);
//         List<Source> sources = snapshot.data?.sources ?? [];
//
//         return SourcesTab(
//           sourcesList: sources,
//         );
//       },
//     );
  }
}
