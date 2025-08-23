import 'package:flutter/material.dart';
import 'package:news_app/models/news_model.dart';

import '../cores/appcolors/appcolors.dart';

class NewsCardWidget extends StatelessWidget {
  const NewsCardWidget({
    super.key,
    required this.article,
  });

  final Articles article;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              article.urlToImage ?? "",
              errorBuilder:
                  (context, error, stackTrace) {
                return SizedBox(
                  height: 50,
                  child: Icon(Icons.error),
                );
              },
            ),
          ),
          Text(article.title ?? ""),
          Row(
            children: [
              Expanded(child: Text(article.author ?? "")),
              SizedBox(width: 10,),
              Text(
                article.publishedAt ?.substring(0,10)?? "",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
