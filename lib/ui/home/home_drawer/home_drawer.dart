import 'package:flutter/material.dart';
import 'package:news_app_c11_thursday/ui/home/home_drawer/drawer_item_widget.dart';

typedef OnMenuItemClicked = void Function(MenuItem item);

class HomeDrawer extends StatelessWidget {
  OnMenuItemClicked onMenuItemClicked;

  HomeDrawer({required this.onMenuItemClicked});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                // height: 110,
                color: Theme.of(context).primaryColor,
                child: Text(
                  'News App!',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      color: Colors.white),
                )),
          ),
          Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        onMenuItemClicked(MenuItem.categories);
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.list,
                            size: 32,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            'Categories',
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    InkWell(
                      onTap: () {
                        onMenuItemClicked(MenuItem.settings);
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.settings,
                            size: 32,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            'Settings',
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

enum MenuItem {
  categories,
  settings,
}
