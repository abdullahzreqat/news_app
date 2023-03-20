import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Layouts/home_layout.dart';
import 'package:news_app/Shared/Cubit/bloc_observer.dart';
import 'package:news_app/Shared/Cubit/cubit.dart';
import 'package:news_app/Shared/Cubit/states.dart';
import 'package:news_app/Shared/network/local/cache_helper.dart';
import 'package:news_app/Shared/network/remote/dio_helper.dart';
import 'package:news_app/Shared/search_cubit/cubit.dart';
import 'package:news_app/Shared/styles/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool isDark = CacheHelper.getData(key: 'isDark');

  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  final bool isDark;

  const MyApp(this.isDark);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AppCubit()..getHealthData()..changeTheme(cachedTheme: isDark)),
          BlocProvider(
            create: (context) => SearchCubit(),
          )
        ],
        child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, states) {},
          builder: (context, states) => MaterialApp(
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode:   AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            debugShowCheckedModeBanner: false,
            home: HomeLayout(),
          ),
        ));
  }
}
