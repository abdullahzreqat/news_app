// ignore_for_file: must_be_immutable

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Shared/components/components.dart';
import 'package:news_app/Shared/search_cubit/cubit.dart';
import 'package:news_app/Shared/search_cubit/states.dart';

class SearchScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Search Article"),
          ),
          body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  searchBar(context),
                 state is SearchNotFoundState
                      ? Center(
                          child: Text(
                            "There's No Result For \"${SearchCubit.get(context).word}\"",
                            style: TextStyle(color: Colors.grey),
                          ),
                        )
                      : ConditionalBuilder(
                          condition: state is! GetSearchLoadingState,
                          builder: (context) => itemsBuilder(
                              articles: SearchCubit.get(context).searchResult,
                              scroll: NeverScrollableScrollPhysics(),
                              shrink: true),
                          fallback: (context) => CircularProgressIndicator(
                            color: Colors.teal,
                          ),
                        )
                ],
              )),
        );
      },
    );
  }
}
