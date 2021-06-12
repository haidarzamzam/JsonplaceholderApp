import 'package:equatable/equatable.dart';

abstract class DataEvent extends Equatable {
  const DataEvent();

  @override
  List<Object> get props => [];
}

class GetDataPostEvent extends DataEvent {
  final String start;
  final String limit;

  GetDataPostEvent({this.start, this.limit});

  @override
  String toString() => 'GetDataPostEvent';
}

class GetDataCategoryEvent extends DataEvent {
  GetDataCategoryEvent();

  @override
  String toString() => 'GetDataCategoryEvent';
}
