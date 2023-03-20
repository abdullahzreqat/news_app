import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Shared/Cubit/cubit.dart';
import 'package:news_app/Shared/Cubit/states.dart';
import 'package:news_app/Shared/components/components.dart';

class TechnologyScreen extends StatelessWidget {
  const TechnologyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},builder: (context,state){
      return ConditionalBuilder(
          condition: AppCubit.get(context).tech.isNotEmpty,
          builder: (context) =>
              itemsBuilder(articles: AppCubit.get(context).tech),
          fallback: (context) => Center(
            child: Center(child: CircularProgressIndicator(color: Colors.teal,)),
          ));
    },
    );
  }

}
