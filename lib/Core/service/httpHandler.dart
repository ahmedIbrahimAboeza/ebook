// ignore: file_names
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import '../../Model/book_details_model.dart';
import '../../Model/book_model.dart';
import '../../Model/categories_details_model.dart';
import '../../Model/categories_model.dart';
import '../../Model/search_model.dart';

class HttpHandler {
  static Future<List<BookModel>> fetchBookData() async {
    http.Response response = await http
        .get(Uri.parse('http://ahmed686-001-site1.atempurl.com/api/Books'));
    List<BookModel> BookList = [];

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      for (Map<String, dynamic> d in data) {
        BookModel model = BookModel.fromJSON(d);
        BookList.add(model);
      }

      return BookList;
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  static Future<List<CategoriesModel>> fetchCategoriesData() async {
    http.Response response = await http.get(
        Uri.parse('http://ahmed686-001-site1.atempurl.com/api/Categories'));
    List<CategoriesModel> categoriesList = [];

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      for (Map<String, dynamic> d in data) {
        CategoriesModel model = CategoriesModel.fromJSON(d);
        categoriesList.add(model);
      }

      return categoriesList;
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  static Future<List<BookDetailsModel>> fetchBooKDetailsData(
      {required String Id}) async {
    http.Response response = await http
        .get(Uri.parse('http://ahmed686-001-site1.atempurl.com/api/Books/$Id'));
    List<BookDetailsModel> BookDetailsList = [];

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      BookDetailsModel model =
          BookDetailsModel.fromJson(jsonDecode(response.body));

      BookDetailsList.add(model);

      return BookDetailsList;
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  static Future<List<CategoriesDetailsModel>> fetchCategoriesDetailsData(
      String id) async {
    http.Response response = await http.get(Uri.parse(
        'http://ahmed686-001-site1.atempurl.com/api/Books/GetBooksByCategory?id=$id'));
    List<CategoriesDetailsModel> categoriesDetailsList = [];

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      for (Map<String, dynamic> d in data) {
        CategoriesDetailsModel model = CategoriesDetailsModel.fromJson(d);
        categoriesDetailsList.add(model);
      }

      return categoriesDetailsList;
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  static Future<List<SearchModel>>? fetchSearchDetailsData(String Text) async {
    http.Response response = await http.get(Uri.parse(
        'http://ahmed686-001-site1.atempurl.com/api/Search?query=${Text}'));
    List<SearchModel> SearchList = [];

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print("$data");
      for (Map<String, dynamic> d in data) {
        SearchModel model = SearchModel.fromJson(d);
        SearchList.add(model);
        print('${SearchList}');
      }

      return SearchList;
    } else {
      return SearchList;
    }
  }
}
