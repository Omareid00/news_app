import 'package:flutter/material.dart';
import 'package:news_app/api_manager/api_manager.dart';
import 'package:news_app/cores/appcolors/appcolors.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: FutureBuilder(future: ApiManager.getNews(), builder: (context, snapshot) {
        if(snapshot.connectionState==ConnectionState.waiting){
          return Center(child: CircularProgressIndicator(),);
        }
        else if(snapshot.hasError){
          return Center(child: Text("Error"),);
        }
        else{
          var article = snapshot.data??[];

          return ListView.builder(itemCount:article.length ,
            itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.black),
                borderRadius: BorderRadius.circular(10),

              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(article[index].urlToImage??"",
                      errorBuilder: (context, error, stackTrace) {
                        return SizedBox(
                          height: 50,
                          child: Icon(Icons.error),
                        );
                      },)),
                  Text(article[index].title??""),
                  Row(

                    children: [
                      Text(article[index].author??""),
                      Spacer(),
                      Text(article[index].publishedAt??""),
                    ],
                  )
                ],
              ),
            );
          },);
        }
      },),
    );
  }
}
