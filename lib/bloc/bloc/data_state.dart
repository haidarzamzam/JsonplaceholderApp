import 'package:case_devido/model/category_model.dart';
import 'package:case_devido/model/post_model.dart';
import 'package:equatable/equatable.dart';

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

class GetDataCategoryState extends DataState {
  final List<CategoryModel> result;

  GetDataCategoryState({this.result});
}
