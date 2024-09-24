import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_c11_thursday/data/api_manager/model/news_response/Article.dart';
import 'package:news_app_c11_thursday/data/api_manager/model/sources_response/Sources.dart';
import 'package:news_app_c11_thursday/ui/home/news/news_item_widget.dart';
import 'package:news_app_c11_thursday/ui/home/news/news_list_view_model.dart';

class NewsListWidget extends StatefulWidget {
  Source source;

  NewsListWidget({required this.source});

  @override
  State<NewsListWidget> createState() => _NewsListWidgetState();
}

class _NewsListWidgetState extends State<NewsListWidget> {
  NewsListViewModel viewModel = NewsListViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNews(widget.source.id);
  }

  @override
  void didUpdateWidget(covariant NewsListWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    viewModel.getNews(widget.source.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsListViewModel, NewsListState>(
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
                      Text(
                        state.errorMessage ?? '',
                      ),
                      ElevatedButton(onPressed: () {}, child: Text('Try again'))
                    ],
                  ),
                );
              }
            case SuccessState():
              {
                List<Article> newsList = state.articles ?? [];
                return ListView.builder(
                  itemBuilder: (context, index) =>
                      NewsItemWidget(article: newsList[index]),
                  itemCount: newsList.length,
                );
              }
          }
        });
    // return FutureBuilder(future: ApiManager.getNews(sourceId: source.id),
    //
    //     builder: (context, snapshot) {
    //   if(snapshot.connectionState == ConnectionState.waiting){
    //     return Center(
    //       child: CircularProgressIndicator(),
    //     );
    //   }
    //   if(snapshot.data?.status == 'error' || snapshot.hasError){
    //     return Center(
    //       child: Column(
    //         children: [
    //           Text(snapshot.data?.message ?? snapshot.error.toString()),
    //           ElevatedButton(onPressed: () {
    //
    //           }, child: Text('Try again'))
    //         ],
    //       ),
    //     );
    //   }
    //   List<Article> newsList = snapshot.data?.articles ?? [];
    //   return ListView.builder(itemBuilder: (context, index) => NewsItemWidget(article: newsList[index]),itemCount: newsList.length,);
    //     },);
  }
}
