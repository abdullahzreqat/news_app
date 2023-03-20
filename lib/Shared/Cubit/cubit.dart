import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Modules/business_screen/business_screen.dart';
import 'package:news_app/Modules/health_screen/health_screen.dart';
import 'package:news_app/Modules/tech_screen/tech_screen.dart';
import 'package:news_app/Shared/Cubit/states.dart';
import 'package:news_app/Shared/network/local/cache_helper.dart';
import 'package:news_app/Shared/network/remote/dio_helper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  bool isDark = false;

  List<Widget> screens = [HealthScreen(), BusinessScreen(), TechnologyScreen()];
  List<BottomNavigationBarItem> bottomNavItems = [
    BottomNavigationBarItem(
        icon: Icon(Icons.health_and_safety_sharp), label: "Health"),
    BottomNavigationBarItem(icon: Icon(Icons.business), label: "Business"),
    BottomNavigationBarItem(icon: Icon(Icons.phonelink), label: "Technology"),
  ];
  int navItemindex = 0;

  List<dynamic> business = [];
  List<dynamic> health = [];
  List<dynamic> tech = [];

  void changeBottomNavState(int index) {
    navItemindex = index;
    if (index == 1) {
      getBusinessData();
    } else if (index == 2) {
      getTechnologyData();
    }

    emit(AppBottomNavState());
  }

  void getBusinessData() {
    emit(AppGetBusinessLoadingState());
    if (business.isEmpty) {
      DioHelper.getData(query: {
        "apikey": "pub_179216cd2b56743b080b442ffc53f68786181",
        "language": "ar",
        "category": "business"
      }).then((value) {
        business = value.data['results'];
        print(business);
        emit(AppGetBusinessData());
      }).catchError((onError) {
        print(onError.toString());
      });
    } else {
      emit(AppGetBusinessData());
    }
  }

  void getHealthData() {
    emit(AppGetHealthLoadingState());
    if (health.isEmpty) {
      DioHelper.getData(query: {
        "apikey": "pub_179216cd2b56743b080b442ffc53f68786181",
        "language": "ar",
        "category": "health"
      }).then((value) {
        health = value.data['results'];
        print(health);
        emit(AppGetHealthData());
      }).catchError((onError) {
        print(onError.toString());
      });
    } else {
      emit(AppGetHealthData());
    }
  }

  void getTechnologyData() {
    emit(AppGetTechnologyLoadingState());

    if (tech.isEmpty) {
      DioHelper.getData(query: {
        "apikey": "pub_179216cd2b56743b080b442ffc53f68786181",
        "language": "ar",
        "category": "technology"
      }).then((value) {
        tech = value.data['results'];
        print(tech);
        emit(AppGetTechnologyData());
      }).catchError((onError) {
        print(onError.toString());
      });
    } else {
      emit(AppGetTechnologyData());
    }
  }

  void changeTheme({bool? cachedTheme}) {
    if(cachedTheme!=null)
      {
        isDark = cachedTheme;
        emit(AppChangeThemeState());
      }
    else {
      isDark = !isDark;
    CacheHelper.putData(key: 'isDark', value: isDark)
        .then((value) {
          emit(AppChangeThemeState());
        });
    }
  }
}
