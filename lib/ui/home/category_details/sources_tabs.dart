import 'package:flutter/material.dart';
import 'package:news_app_c11_thursday/api_manager/model/Sources.dart';
import 'package:news_app_c11_thursday/ui/widgets/tab_item_widget.dart';

class SourcesTab extends StatefulWidget {
  List<Sources> sourcesList;

  SourcesTab({required this.sourcesList});

  @override
  State<SourcesTab> createState() => _SourcesTabState();
}

class _SourcesTabState extends State<SourcesTab> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
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
                .toList()));
  }
}
