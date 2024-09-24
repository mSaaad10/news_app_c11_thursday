import 'package:flutter/material.dart';
import 'package:news_app_c11_thursday/data/api_manager/model/sources_response/Sources.dart';
import 'package:news_app_c11_thursday/ui/home/news/news_list_widget.dart';
import 'package:news_app_c11_thursday/ui/widgets/tab_item_widget.dart';

class SourcesTab extends StatefulWidget {
  List<Source> sourcesList;

  SourcesTab({required this.sourcesList});

  @override
  State<SourcesTab> createState() => _SourcesTabState();
}

class _SourcesTabState extends State<SourcesTab> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
            length: widget.sourcesList.length,
            child: TabBar(
                onTap: (index) {
                  selectedIndex = index;
                  print(selectedIndex);
                  setState(() {});
                },
                indicatorColor: Colors.transparent,
                dividerColor: Colors.transparent,
                isScrollable: true,
                tabs: widget.sourcesList
                    .map(
                      (source) => TabItemWidget(
                        source: source,
                        isSelected:
                            selectedIndex == widget.sourcesList.indexOf(source),
                      ),
                    )
                    .toList())),
        Expanded(
            child: NewsListWidget(source: widget.sourcesList[selectedIndex]))
      ],
    );
  }
}
