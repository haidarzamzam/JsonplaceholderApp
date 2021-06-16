import 'dart:async' show Future;
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/services.dart';
import 'package:jsonplaceholder_app/model/category_model.dart';
import 'package:jsonplaceholder_app/model/post_model.dart';
import 'package:jsonplaceholder_app/utils/endpoint.dart';

import '../app.dart';

Dio _dio = App().dio;

Future<List<PostModel>> getDataPost(Map<String, dynamic> payload) async {
  Response response = await _dio.get(
    Endpoint.postData,
    queryParameters: {"_start": payload['start'], "_limit": payload['limit']},
  );

  List data = [];
  if (response.statusCode == 200) {
    final List parsedList = response.data;
    data = parsedList.map((e) => PostModel.fromJson(e)).toList();
  }

  return data;
}

Future<List<CategoryModel>> getDataCategory(
    Map<String, dynamic> payload) async {
  List<CategoryModel> tempList = [];
  List<CategoryModel> categoryList = [];
  List parsedList =
      json.decode(await rootBundle.loadString('assets/data/category.json'));

  tempList = parsedList.map((e) => CategoryModel.fromJson(e)).toList();
  categoryList = tempList;

  if (payload['keyword'] == "") {
    categoryList = tempList;
  } else {
    List<CategoryModel> filteredList = [];

    tempList.map((e) {
      if (e.title.toLowerCase().contains(payload['keyword'].toLowerCase())) {
        filteredList.add(e);
      }
    }).toList();

    categoryList = filteredList;
  }

  return categoryList;
}
