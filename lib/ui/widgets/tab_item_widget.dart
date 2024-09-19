import 'package:flutter/material.dart';
import 'package:news_app_c11_thursday/api_manager/model/Sources.dart';

class TabItemWidget extends StatelessWidget {
  bool isSelected;
  Sources source;

  TabItemWidget({required this.source, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
            color: isSelected ? Colors.transparent : Colors.green, width: 2),
        color: isSelected ? Colors.green : Colors.transparent,
      ),
      child: Text(
        source.name ?? '',
        style: TextStyle(
            fontSize: 14,
            color: isSelected ? Colors.white : Colors.green,
            fontWeight: FontWeight.w400),
      ),
    );
  }
}
