// ignore: file_names
// ignore: file_names

abstract class BookStates {}

class BookIntialStates extends BookStates {}

class BookLoading extends BookStates {}

class GetBookDataSuccess extends BookStates {}

class GetBookDataError extends BookStates {}

class CategoriesLoading extends BookStates {}

class GetCategoriesDataSuccess extends BookStates {}

class GetCategoriesDataError extends BookStates {
  final String error;

  GetCategoriesDataError(this.error);
}

class ChangeThemeInitState extends BookStates {}

class ChangeBottomNavIndexState extends BookStates {}

class BookDetailsLoading extends BookStates {}

class GetBookDetailsDataSuccess extends BookStates {}

class GetBookDetailsDataError extends BookStates {}

class CategoriesDetailsLoading extends BookStates {}

class GetCategoriesDetailsDataSuccess extends BookStates {}

class GetCategoriesDetailsDataError extends BookStates {}

class SearchLoading extends BookStates {}

class GetSearchDataSuccess extends BookStates {}

class GetSearchDataError extends BookStates {}
