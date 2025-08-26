import 'package:flutter/material.dart';
import 'package:news_app/api_manager/tab_bar_provider.dart';
import 'package:news_app/cores/appcolors/appcolors.dart';
import 'package:news_app/models/categorie_data_model.dart';
import 'package:news_app/models/news_card_widget.dart';
import 'package:news_app/screens/presentation/view_model/news_view_model.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  late NewsProvider newsProvider;
  late TabBarProvider tabBarProvider;
  @override
  void initState() {
    newsProvider =NewsProvider();
    tabBarProvider =TabBarProvider();
    super.initState();
  }
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    AppCategorie category = ModalRoute.of(context)?.settings.arguments as AppCategorie;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(category.name),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: ChangeNotifierProvider(
          create: (context) => TabBarProvider()..getSources(category.id),
          child: Consumer<TabBarProvider>(
            builder: (context, vm, child) {
              return DefaultTabController(
                length: vm.sources.length+1,
                child: Column(
                  children: [
                    TabBar(
                      tabAlignment: TabAlignment.start,
                      onTap: (value) {
                        if(value == 0){
                          newsProvider.getNews(null,category.id);

                        }else{
                          newsProvider.getNews(vm.sources[value-1].id);
                        }
                        selectedTabIndex = value;
                      },
                      isScrollable: true,
                      indicatorColor: AppColors.black,
                      labelColor: AppColors.black,
                      unselectedLabelColor: AppColors.black,
                      dividerColor: Colors.transparent,

                      tabs: [
                        Text("Headline"),
                        ... vm.sources.map((e) {
                          return Tab(text: e.name ?? "");
                        }),

                      ]
                    ),
                  ],
                ),
              );

            },
          ),
        ),
      ),),
      body: ChangeNotifierProvider(
        create: (context) => newsProvider..getNews(null,category.id),
        child: Consumer<NewsProvider>(
          builder: (context, vm, _) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: vm.articles.length,
                    itemBuilder: (context, index) {
                      return NewsCardWidget(article: vm.articles[index]);
                    },

                  ),
                )
              ],
            );


          },
        ),
      )
    );
  }
}
