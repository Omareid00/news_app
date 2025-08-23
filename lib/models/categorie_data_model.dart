import 'package:news_app/cores/appimages/app_images.dart';

class AppCategorie {

  final String id;
  final String name;
  final String image;

  AppCategorie({
    required this.id,
    required this.name,
    required this.image,
  });
  static List<AppCategorie> categories = [
    AppCategorie(id: "general", name: "General", image: AppImages.genral),
    AppCategorie(id: "business", name: "Business", image: AppImages.business),
    AppCategorie(id: "sports", name: "Sports", image: AppImages.sports),
    AppCategorie(id: "technology", name: "Technology", image: AppImages.technology),
    AppCategorie(id: "science", name: "Science", image: AppImages.sciense),
    AppCategorie(id: "health", name: "Health", image: AppImages.health),
    AppCategorie(id: "entertainment", name: "Entertainment", image: AppImages.entertainment),

  ];



}