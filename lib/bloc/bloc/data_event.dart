import 'package:equatable/equatable.dart';

abstract class DataEvent extends Equatable {
  const DataEvent();

  @override
  List<Object> get props => [];
}

class GetDataCategoryEvent extends DataEvent {
  GetDataCategoryEvent();

  @override
  String toString() => 'GetDataCategoryEvent';
}
