import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:news_app/cores/app_routes/app_routes.dart';
import 'package:news_app/cores/appcolors/appcolors.dart';
import 'package:news_app/cores/appimages/app_images.dart';
import 'package:news_app/models/categorie_data_model.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  final List<String> themes = ['Light', 'Dark'];
  final List<String> languageList  = ['English', 'Arabic'];
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Home', style: theme.textTheme.bodyLarge),
        actions: [Icon(Icons.search)],
      ),
      drawer: Drawer(
        child: Container(
          color: AppColors.black,
          child: Column(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: AppColors.white,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          "News App",
                          style: theme.textTheme.bodyLarge?.copyWith(
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.home,color: AppColors.white,),
                        TextButton(
                          onPressed: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LayoutScreen(),
                            ),
                          ),
                          child: Text(
                            "Go To Home",
                            style: theme.textTheme.bodyLarge?.copyWith(color: AppColors.white),
                          ),
                        ),
                      ],
                    ),
                    Divider(color: AppColors.white,),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Icon(Icons.imagesearch_roller_sharp,color: AppColors.white,),
                        SizedBox(width: 10,),
                        Text("Theme",style: theme.textTheme.bodyLarge?.copyWith(color: AppColors.white),)
                      ],
                    ),
                    SizedBox(height: 20,),
                    CustomDropdown<String>(
                      decoration: CustomDropdownDecoration(
                        headerStyle: TextStyle(
                          color: AppColors.white,
                        ),
                        closedFillColor: AppColors.black,
                        closedBorder: Border.all(color: AppColors.white),
                        closedSuffixIcon: Icon(Icons.arrow_drop_down,color: AppColors.white,),

                      ),
                      items: themes,
                      onChanged: (value) {

                      },
                    ),
                    SizedBox(height: 20,),
                    Divider(color: AppColors.white,),

                    SizedBox(height: 20,),
                    Row(
                      children: [
                        ImageIcon(AssetImage(AppImages.golbalIcon),color: AppColors.white,),
                        SizedBox(width: 10,),
                        Text("Language",style: theme.textTheme.bodyLarge?.copyWith(color: AppColors.white),)
                      ],
                    ),
                    SizedBox(height: 20,),
                    CustomDropdown<String>(
                      decoration: CustomDropdownDecoration(
                        headerStyle: TextStyle(
                          color: AppColors.white,
                        ),
                        closedFillColor: AppColors.black,
                        closedBorder: Border.all(color: AppColors.white),
                        closedSuffixIcon: Icon(Icons.arrow_drop_down,color: AppColors.white,),

                      ),
                      items: languageList,
                      onChanged: (value) {

                      },
                    ),


                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                "Good Morning\nHere is some news for you",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),

                itemBuilder: (context, index) => Stack(
                  alignment: index % 2 == 0
                      ? Alignment.bottomRight
                      : Alignment.bottomLeft,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        AppCategorie.categories[index].image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(
                        context,
                        APPROUTES.newsScreen,
                        arguments: AppCategorie.categories[index],
                      ),

                      child: SizedBox(
                        width: 170,
                        child: Container(
                          width: 170,
                          height: 55,

                          margin: EdgeInsets.symmetric(vertical: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(85),
                            color: AppColors.white.withOpacity(0.5),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(width: 10),
                              Text(
                                "View All",
                                style: TextStyle(
                                  color: AppColors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(width: 5),
                              CircleAvatar(
                                radius: 25,
                                backgroundColor: AppColors.white,
                                child: index % 2 == 0
                                    ? Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: AppColors.black,
                                      )
                                    : Icon(
                                        Icons.arrow_back_ios_rounded,
                                        color: AppColors.black,
                                      ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                separatorBuilder: (context, index) {
                  return SizedBox(height: 10);
                },
                itemCount: AppCategorie.categories.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
