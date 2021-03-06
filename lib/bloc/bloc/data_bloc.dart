import 'package:bloc/bloc.dart';
import 'package:jsonplaceholder_app/model/category_model.dart';
import 'package:jsonplaceholder_app/model/post_model.dart';
import 'package:jsonplaceholder_app/services/data_services.dart';

import 'bloc.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  @override
  DataState get initialState => DataInitial();

  @override
  Stream<DataState> mapEventToState(
    DataEvent event,
  ) async* {
    if (event is GetDataPostEvent) {
      yield* _getDataPost(event);
    } else if (event is GetDataCategoryEvent) {
      yield* _getDataCategory(event);
    }
  }

  Stream<DataState> _getDataPost(GetDataPostEvent event) async* {
    yield DataInitial();

    Map<String, dynamic> payload = {
      'start': event.start,
      'limit': event.limit,
    };

    List<PostModel> response;
    try {
      response = await getDataPost(payload);

      yield GetDataPostSuccessState(result: response);
    } catch (err) {
      yield GetDataPostFailedState(
          message: err?.response?.statusCode.toString());
    }
  }

  Stream<DataState> _getDataCategory(GetDataCategoryEvent event) async* {
    yield DataInitial();

    Map<String, dynamic> payload = {'keyword': event.keyword};

    List<CategoryModel> response;

    try {
      response = await getDataCategory(payload);
      yield GetDataCategorySuccessState(result: response);
    } catch (err) {
      yield GetDataCategoryFailedState(message: err?.toString());
    }
  }
}
