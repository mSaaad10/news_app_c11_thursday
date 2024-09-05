import 'package:flutter/material.dart';

class DrawerItemWidget extends StatelessWidget {
  IconData icon;
  String text;

  DrawerItemWidget({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          Icon(
            icon,
            size: 32,
          ),
          SizedBox(
            width: 6,
          ),
          Text(
            text,
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.w700, color: Colors.black),
          )
        ],
      ),
    );
  }
}
