import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layout/cubit/cubit.dart';
import 'package:newsapp/layout/cubit/states.dart';
import 'package:newsapp/shared/network/remote/dio_helper.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getBusiness(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'News App',
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    DioHelper.getData(
                        url: 'https://newsapi.org/v2/everything',
                        query: {
                          'q': 'tesla',
                          'from': '2023-09-30',
                          'sortBy': 'publishedAt',
                          'apiKey': '372ac5c8751f4bb0a0624f15df043f98',
                        }).then((value) {
                      print(value.data['articles'][2]['urlToImage']);
                    }).catchError((error) {
                      print(error.data.toString());
                    });
                  },
                  icon: const Icon(
                    Icons.search,
                  ),
                ),
              ],
            ),
            body: cubit.screens[cubit.curentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.curentIndex,
              items: cubit.bottomNavItem,
              onTap: (index) => cubit.changeNavBar(index),
              type: BottomNavigationBarType.fixed,
            ),
          );
        },
      ),
    );
  }
}
