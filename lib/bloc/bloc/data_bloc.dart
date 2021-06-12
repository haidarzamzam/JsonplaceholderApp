import 'package:bloc/bloc.dart';
import 'package:case_devido/model/category_model.dart';
import 'package:case_devido/model/post_model.dart';
import 'package:case_devido/services/data_services.dart';

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
      'start': event.start.trim(),
      'limit': event.limit.trim(),
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
    List<CategoryModel> response;

    response = await getDataCategory();

    yield GetDataCategoryState(result: response);
  }
}
