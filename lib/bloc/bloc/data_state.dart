import 'package:equatable/equatable.dart';
import 'package:jsonplaceholder_app/model/category_model.dart';
import 'package:jsonplaceholder_app/model/post_model.dart';

abstract class DataState extends Equatable {
  const DataState();

  @override
  List<Object> get props => [];
}

class DataInitial extends DataState {}

class GetDataPostSuccessState extends DataState {
  final List<PostModel> result;

  GetDataPostSuccessState({this.result});
}

class GetDataPostFailedState extends DataState {
  final String message;

  GetDataPostFailedState({this.message});
}

class GetDataCategorySuccessState extends DataState {
  final List<CategoryModel> result;

  GetDataCategorySuccessState({this.result});
}

class GetDataCategoryFailedState extends DataState {
  final String message;

  GetDataCategoryFailedState({this.message});
}