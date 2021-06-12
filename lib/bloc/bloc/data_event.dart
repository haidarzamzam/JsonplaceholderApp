import 'package:equatable/equatable.dart';

abstract class DataEvent extends Equatable {
  const DataEvent();

  @override
  List<Object> get props => [];
}

class GetDataPostEvent extends DataEvent {
  final int start;
  final int limit;

  GetDataPostEvent({this.start, this.limit});

  @override
  String toString() => 'GetDataPostEvent';
}

class GetDataCategoryEvent extends DataEvent {
  final String keyword;

  GetDataCategoryEvent({this.keyword});

  @override
  String toString() => 'GetDataCategoryEvent';
}
