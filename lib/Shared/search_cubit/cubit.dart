import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Shared/network/remote/dio_helper.dart';
import 'package:news_app/Shared/search_cubit/states.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitialState());

  static SearchCubit get(context) => BlocProvider.of(context);

  List<dynamic> searchResult = [];
  String word = "";

  void searchFor(String keyword) {
    emit(GetSearchLoadingState());
    word=keyword;
    searchResult = [];
    DioHelper.getData(query: {
      "apikey": "pub_179216cd2b56743b080b442ffc53f68786181",
      "language": "ar",
      "q": "%$keyword%"
    }).then((value) {
      searchResult = value.data['results'];
      if (keyword.isNotEmpty && searchResult.isEmpty) {
        emit(SearchNotFoundState());
      } else {
        emit(SearchState());
      }
      print(searchResult);
    }).catchError((onError) {
      print(onError.toString());
    });
  }
}
