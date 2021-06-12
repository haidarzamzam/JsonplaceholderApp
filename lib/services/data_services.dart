import 'dart:async' show Future;
import 'dart:convert';

import 'package:case_devido/model/category_model.dart';
import 'package:case_devido/model/post_model.dart';
import 'package:case_devido/utils/endpoint.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/services.dart';

import '../app.dart';

Dio _dio = App().dio;

Future<PostModel> getDataPost(Map<String, dynamic> payload) async {
  Response response = await _dio.get(
    Endpoint.post,
    queryParameters: {"_start": payload['start'], "_limit": payload['limit']},
  );

  if (response.statusCode == 200) {
    print(response.data);
    return PostModel.fromJson(response.data);
  }
}

Future<List<CategoryModel>> getDataCategory() async {
  final List parsedList =
      json.decode(await rootBundle.loadString('assets/data/category.json'));

  return parsedList.map((e) => CategoryModel.fromJson(e)).toList();
}
