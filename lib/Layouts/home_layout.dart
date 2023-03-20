// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Modules/search_screen/search_screen.dart';
import 'package:news_app/Shared/Cubit/cubit.dart';
import 'package:news_app/Shared/Cubit/states.dart';
import 'package:news_app/Shared/components/components.dart';

class HomeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    cubit.changeTheme();
                  }
                    ,
                  icon: Icon(
                    Icons.brightness_medium_outlined,
                    color: Colors.teal,
                    size: 25,
                  )),
              IconButton(
                  onPressed: () =>
                      navigateTo(context: context, page: SearchScreen()),
                  icon: Icon(
                    Icons.search,
                    color: Colors.teal,
                    size: 27,
                  )),

            ],
            title: Text("News App"),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.bottomNavItems,
            currentIndex: cubit.navItemindex,
            onTap: (index) => cubit.changeBottomNavState(index),
          ),
          body: cubit.screens[cubit.navItemindex],
        );
      },
    );
  }
}
