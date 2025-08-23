import 'package:flutter/material.dart';
import 'package:news_app/cores/app_routes/app_routes.dart';
import 'package:news_app/cores/appcolors/appcolors.dart';
import 'package:news_app/models/categorie_data_model.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {


  @override
  Widget build(BuildContext context) {
    var theme= Theme.of(context);
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Home',style: theme.textTheme.bodyLarge,),
        actions: [Icon(Icons.search)],
      ),
      drawer: Drawer(

        child: Column(children: [
          Row(
            children: [
              Expanded(
                child: DrawerHeader(
                  margin: EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    color: AppColors.black,
                    borderRadius: BorderRadius.circular(0),

                  ),
                    child:Center(child: Text("Home",style: TextStyle(color: AppColors.white,)) ),
              ),
              ),
            ],
          )
        ],),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Text(
                "Good Morning\nHere is some news for you",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,
                color: AppColors.black),
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
          
                itemBuilder: (context, index) => Stack(
                  alignment: index % 2 == 0 ? Alignment.bottomRight : Alignment.bottomLeft,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                        child: Image.asset(AppCategorie.categories[index].image,fit: BoxFit.cover,)),
                    GestureDetector(
                    onTap: () => Navigator.pushNamed(context, APPROUTES.newsScreen,arguments: AppCategorie.categories[index]),

                      child: SizedBox(
                        width: 170,
                      child: Container(
                        width: 170,
                        height: 55,

                        margin: EdgeInsets.symmetric(vertical: 20,),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(85),
                          color: AppColors.white.withOpacity(0.5),

                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(width: 10,),
                            Text("View All",style: TextStyle(color: AppColors.black,fontSize: 24,fontWeight: FontWeight.w500),),
                            SizedBox(width: 5,),
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: AppColors.white,
                              child: Icon(Icons.arrow_forward_ios_rounded,color: AppColors.black,),
                            )
                          ],
                        ),
                      ),
                    ),),
                  ],
                ),
                  separatorBuilder:
                (context, index) {
                  return SizedBox(height: 10,);
                },
                  itemCount: AppCategorie.categories.length,)
            ],
          
          
          ),
        ),
      ),
    );
  }
}
