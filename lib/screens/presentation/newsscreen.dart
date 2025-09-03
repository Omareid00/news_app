import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api_manager/tab_bar_provider.dart';
import 'package:news_app/cores/appcolors/appcolors.dart';
import 'package:news_app/models/categorie_data_model.dart';
import 'package:news_app/models/news_card_widget.dart';
import 'package:news_app/screens/presentation/cubit/news_cubit.dart';
import 'package:news_app/screens/presentation/cubit/news_states.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  // late NewsProvider newsProvider;
  late NewsCubit newsCubit;
  late TabBarProvider tabBarProvider;
  @override
  void initState() {
    // newsProvider =NewsProvider();
    newsCubit = NewsCubit();
    // tabBarProvider = TabBarProvider();
    super.initState();
  }

  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    AppCategorie category =
        ModalRoute.of(context)?.settings.arguments as AppCategorie;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search))
        ],
        centerTitle: true,
        title: Text(category.name),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: BlocProvider<NewsCubit>(
            create: (context) => newsCubit..getSources(category.id),
            child: BlocBuilder<NewsCubit, NewsStates>(
              builder: (context, state) {
                if (state is GetSourceSuccessState) {
                  return DefaultTabController(
                    length: state.sources.length + 1,
                    child: Column(
                      children: [
                        TabBar(
                          tabAlignment: TabAlignment.start,
                          onTap: (value) {
                            if (value == 0) {
                              newsCubit.getNews(null, category.id);
                            } else {
                              newsCubit.getNews(state.sources[value - 1].id);
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
                            ...state.sources.map((e) {
                              return Tab(text: e.name ?? "");
                            }),
                          ],
                        ),
                      ],
                    ),
                  );
                } else {
                  return SizedBox();
                }
              },
              buildWhen: (previous, current) {
                return (current is GetSourceSuccessState ||
                    current is GetSourceErrorState ||
                    current is GetSourceLoadingState);
              },
            ),
          ),
        ),
      ),
      body: BlocProvider<NewsCubit>(
        create: (context) => newsCubit..getNews(null, category.id),
        child: BlocConsumer<NewsCubit, NewsStates>(
          builder: (context, state) {
            if (state is GetNewsLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GetNewsErrorState) {
              return Center(child: Text(state.error));
            } else if (state is GetNewsSuccessState) {
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.articles.length,
                      itemBuilder: (context, index) {
                        return
                          NewsCardWidget(article: state.articles[index]);
                      },
                    ),
                  ),
                ],
              );
            }
            return const SizedBox();
          },
          buildWhen: (previous, current) {
            return (current is GetNewsSuccessState ||
                current is GetNewsErrorState ||
                current is GetNewsLoadingState);
          },

          listener: (BuildContext context, NewsStates state) {
            if (state is GetNewsLoadingState) {
              showDialog(
                context: context,
                builder: (context) {
                  return const AlertDialog();
                },
              );
            }
            // if(state is SuccessState){
            //   Navigator.pop(context);
            // }
          },
        ),
      ),
    );
  }
}
