import 'package:case_devido/model/category_model.dart';
import 'package:equatable/equatable.dart';

abstract class DataState extends Equatable {
  const DataState();

  @override
  List<Object> get props => [];
}

class DataInitial extends DataState {}

class GetDataCategoryState extends DataState {
  final List<CategoryModel> result;

  GetDataCategoryState({this.result});
}
