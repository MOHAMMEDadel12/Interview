import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/modules/business/business.dart';
import 'package:news_app/modules/science/science.dart';
import 'package:news_app/modules/sports/sports.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

import '../../shared/components/constants.dart';
import '../../shared/network/remote/end-points.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<dynamic> business = [];
  List<dynamic> sports = [];
  List<dynamic> science = [];

  void getBusiness() {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(
      url: '${getCategory}',
      query: {'country': 'eg', 'category': 'business', 'apiKey': '$API_KEY'},
    ).then((value) {
      business = value.data['articles'];
      print(business[0]['title']);
      emit(NewsGetBusinessSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  void getSports() {
    emit(NewsGetSportsLoadingState());

    if (sports.length == 0) {
      DioHelper.getData(
        url: '$getCategory',
        query: {
          'country': 'eg',
          'category': 'sports',
          'apiKey': '$API_KEY',
        },
      ).then((value) {
        sports = value.data['articles'];
        print(sports[0]['title']);

        emit(NewsGetSportsSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetSportsErrorState(error.toString()));
      });
    } else {
      emit(NewsGetSportsSuccessState());
    }
  }

  void getScience() {
    emit(NewsGetScienceLoadingState());

    if (science.length == 0) {
      DioHelper.getData(
        url: getCategory,
        query: {
          'country': 'eg',
          'category': 'science',
          'apiKey': '$API_KEY',
        },
      ).then((value) {
        science = value.data['articles'];
        emit(NewsGetScienceSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetScienceErrorState(error.toString()));
      });
    } else {
      emit(NewsGetScienceSuccessState());
    }
  }
}
