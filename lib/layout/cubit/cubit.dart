import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layout/cubit/states.dart';
import 'package:newsapp/modules/business/business_screen.dart';
import 'package:newsapp/modules/science/science_screen.dart';
import 'package:newsapp/modules/settings/settings_screen.dart';
import 'package:newsapp/modules/sports/sports_screen.dart';
import 'package:newsapp/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int curentIndex = 0;

  List<BottomNavigationBarItem> bottomNavItem = [
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.business_rounded,
      ),
      label: 'Business',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.sports,
      ),
      label: 'Sports',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.science_rounded,
      ),
      label: 'Science',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.settings,
      ),
      label: 'Settings',
    ),
  ];

  List<Widget> screens = [
    const BusinessScreen(),
    const SportsScreen(),
    const ScienceScreen(),
    const SettingsScreen(),
  ];

  void changeNavBar(index) {
    curentIndex = index;
    if (index == 1) getSports();
    if (index == 2) getScience();
    emit(NewsBottomSheetState());
  }

  List<dynamic> business = [];

  void getBusiness() {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(
      url: 'https://newsapi.org/v2/everything',
      query: {
        'q': 'business',
        'sortBy': 'publishedAt',
        'apiKey': '372ac5c8751f4bb0a0624f15df043f98',
      },
    ).then((value) {
      business = value.data['articles'];
      emit(NewsGetBusinessSuccessState());
      print('my data is ${value.data['articles'].toString()}');
    }).catchError((error) {
      emit(NewsGetBusinessErrorState(error: error.toString()));
      print(error.toString());
    });
  }

  //get sports
  List<dynamic> sports = [];

  void getSports() {
    emit(NewsGetSportsLoadingState());
    if (sports.isEmpty) {
      DioHelper.getData(
        url: 'https://newsapi.org/v2/everything',
        query: {
          'q': 'football',
          'sortBy': 'publishedAt',
          'apiKey': '372ac5c8751f4bb0a0624f15df043f98',
        },
      ).then((value) {
        sports = value.data['articles'];
        emit(NewsGetSportsSuccessState());
        print('my data is ${value.data['articles'].toString()}');
      }).catchError((error) {
        emit(NewsGetSportsErrorState(error: error.toString()));
        print(error.toString());
      });
    } else {
      emit(NewsGetSportsSuccessState());
    }
  }

  //get science
  List<dynamic> science = [];

  void getScience() {
    emit(NewsGetScienceLoadingState());
    DioHelper.getData(
      url: 'https://newsapi.org/v2/everything',
      query: {
        'q': 'science',
        'sortBy': 'publishedAt',
        'apiKey': '372ac5c8751f4bb0a0624f15df043f98',
      },
    ).then((value) {
      science = value.data['articles'];
      emit(NewsGetScienceSuccessState());
      print('my data is ${value.data['articles'].toString()}');
    }).catchError((error) {
      emit(NewsGetScienceErrorState(error: error.toString()));
      print(error.toString());
    });
  }
}
