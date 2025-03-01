import 'package:flutter/material.dart';
import 'package:news_app_c11_thursday/core/utils/image_utils.dart';

class CategoryItem {
  String categoryId;
  String title;
  Color backgroundColor;
  String imagePath;

  CategoryItem(
      {required this.categoryId,
      required this.title,
      required this.backgroundColor,
      required this.imagePath});

  // static List<CategoryItem> cats = [
  static List<CategoryItem> getCategoriesList() {
    return [
      CategoryItem(
          categoryId: 'sports',
          title: 'Sports',
          imagePath: ImageUtils.getImagePathByName(imageName: 'sports.png'),
          backgroundColor: Color(0xFFC91C22)),
      CategoryItem(
          categoryId: 'general',
          title: 'General',
          imagePath: ImageUtils.getImagePathByName(imageName: 'Politics.png'),
          backgroundColor: Color(0xFF003E90)),
      CategoryItem(
          categoryId: 'health',
          title: 'Health',
          imagePath: ImageUtils.getImagePathByName(imageName: 'health.png'),
          backgroundColor: Color(0xFFED1E79)),
      CategoryItem(
          categoryId: 'business',
          title: 'Business',
          imagePath: ImageUtils.getImagePathByName(imageName: 'bussines.png'),
          backgroundColor: Color(0xFFCF7E48)),
      CategoryItem(
          categoryId: 'entertainment',
          title: 'Entertainment',
          imagePath:
              ImageUtils.getImagePathByName(imageName: 'environment.png'),
          backgroundColor: Color(0xFF4882CF)),
      CategoryItem(
          categoryId: 'science',
          title: 'Science',
          imagePath: ImageUtils.getImagePathByName(imageName: 'science.png'),
          backgroundColor: Color(0xFFF2D352)),
      CategoryItem(
          categoryId: 'technology',
          title: 'Technology',
          imagePath: ImageUtils.getImagePathByName(imageName: 'Politics.png'),
          backgroundColor: Colors.teal),
    ];
  }

// static List<CategoryItem> getCategoriesList() {
//   return [
//     CategoryItem(
//         categoryId: 'sports',
//         title: 'Sports',
//         imagePath: ImageUtils.getImagePathByName(imageName: 'sports.png'),
//         backgroundColor: Color(0xFFC91C22)),
//     CategoryItem(
//         categoryId: 'general',
//         title: 'General',
//         imagePath: ImageUtils.getImagePathByName(imageName: 'Politics.png'),
//         backgroundColor: Color(0xFF003E90)),
//     CategoryItem(
//         categoryId: 'health',
//         title: 'Health',
//         imagePath: ImageUtils.getImagePathByName(imageName: 'health.png'),
//         backgroundColor: Color(0xFFED1E79)),
//     CategoryItem(
//         categoryId: 'business',
//         title: 'Business',
//         imagePath: ImageUtils.getImagePathByName(imageName: 'bussines.png'),
//         backgroundColor: Color(0xFFCF7E48)),
//     CategoryItem(
//         categoryId: 'entertainment',
//         title: 'Entertainment',
//         imagePath:
//         ImageUtils.getImagePathByName(imageName: 'environment.png'),
//         backgroundColor: Color(0xFF4882CF)),
//     CategoryItem(
//         categoryId: 'science',
//         title: 'Science',
//         imagePath: ImageUtils.getImagePathByName(imageName: 'science.png'),
//         backgroundColor: Color(0xFFF2D352)),
//     CategoryItem(
//         categoryId: 'technology',
//         title: 'Technology',
//         imagePath: ImageUtils.getImagePathByName(imageName: 'Politics.png'),
//         backgroundColor: Colors.teal),
//   ];
// }
}
