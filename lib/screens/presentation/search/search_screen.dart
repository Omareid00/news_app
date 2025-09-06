import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/api_manager/api_manager.dart';
import 'package:news_app/cores/appcolors/appcolors.dart';
import 'package:news_app/models/news_card_widget.dart';
import 'package:news_app/models/news_model.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Articles> articles = [];
  int currentPage = 1;
  int maxPage = 0;
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: const SizedBox.shrink(),
              leadingWidth: 0,
              backgroundColor: Colors.black,
              title: TextFormField(
                onFieldSubmitted: (value) {
                  currentPage = 1;
                  maxPage = 0;
                  _search();
                },
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                controller: searchController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search",
                  hintStyle: const TextStyle(color: Colors.white),
                  prefixIcon: const Icon(Icons.search, color: Colors.white),
                  suffixIcon: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.clear, color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ),

            if (articles.isEmpty)
              SliverToBoxAdapter(
                child: Lottie.asset(
                  "assets/animations/empty_animation.json",
                ),
              ),

            if (articles.isNotEmpty)
              SliverList.separated(
                itemBuilder:(context, index) {
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: NewsCardWidget(
                      key: ValueKey(articles[index].url ?? index),
                      article: articles[index],
                    ),
                  );

                },
                separatorBuilder: (context, index) =>
                const SizedBox(height: 16),
                itemCount: articles.length,
              ),
          ],
        ),
      ),
    );
  }

  _search() async {
    try {
      var response = await ApiManager.searchArticle(
        searchQuery: searchController.text,
        pageNumber: currentPage,
      );
      articles = response.articles!;
      maxPage = response.totalResults!.toInt();
    } catch (e) {
      debugPrint(e.toString());
    }
    setState(() {});
  }
}
