import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../../../Model/book_model.dart';
import '../../../Model/categories_details_model.dart';
import '../../../Model/categories_model.dart';
import '../../../Model/search_model.dart';
import '../../../View/Screen/Search/Search.dart';
import '../../../View/Screen/book/book_view.dart';
import '../../../View/Screen/Categories/categories_view.dart';
import '../../../View/Screen/profile/Profile_screen.dart';
import '../../../constance.dart';
import '../httpHandler.dart';
import 'States.dart';

class BookCubit extends Cubit<BookStates> {
  BookCubit() : super(BookIntialStates());
  static BookCubit get(context) => BlocProvider.of(context);
  // ignore: non_constant_identifier_names
  ChangeTheme() {
    isDark = !isDark;
    emit(ChangeThemeInitState());
  }

  int initialIndex = 0;
  List screen = [
    const BookView(),
    SearchScreen(),
    const CategoriesView(),
    const ProfileScreen(),
  ];
  // ignore: non_constant_identifier_names
  void ChangeBottomNavIndex(int index) {
    initialIndex = index;
    emit(ChangeBottomNavIndexState());
  }

  late Future<List<BookModel>> bookList;
  late Future<List<CategoriesModel>> categoriesList;
  Future<List>? bookDetailsList;
  Future<List<SearchModel>>? SearchList;

  late Future<List<CategoriesDetailsModel>> categoriesDetailsList;

  void GetBookData() {
    emit(BookLoading());
    bookList = HttpHandler.fetchBookData();
    emit(GetBookDataSuccess());
    print("${bookList}");
  }

  void GetCategoriesData() {
    emit(CategoriesLoading());
    categoriesList = HttpHandler.fetchCategoriesData();
    emit(GetCategoriesDataSuccess());
    print("${categoriesList}");
  }

  void GetBookDetailsData(var bookId) async {
    emit(BookDetailsLoading());
    bookDetailsList = HttpHandler.fetchBooKDetailsData(Id: bookId.toString());
    emit(GetBookDetailsDataSuccess());
    print("${bookDetailsList}");
  }

  void GetCategoriesDetailsData(var id) {
    emit(CategoriesDetailsLoading());
    categoriesDetailsList =
        HttpHandler.fetchCategoriesDetailsData(id.toString());
    emit(GetCategoriesDetailsDataSuccess());
    print("${categoriesList}");
  }

  void GetSearchData(String text) {
    emit(SearchLoading());
    SearchList = HttpHandler.fetchSearchDetailsData(text);
    emit(GetSearchDataSuccess());
    ;
  }
}
