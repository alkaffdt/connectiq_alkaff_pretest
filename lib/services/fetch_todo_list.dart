import 'package:connectiq_alkaff_pretest/cores/configs/api_config.dart';
import 'package:connectiq_alkaff_pretest/models/todo_model.dart';
import 'package:connectiq_alkaff_pretest/services/api_service.dart';

extension FetchTodoList on ApiService {
  Future<List<Todo>> fetchTodoList({
    required int start,
    int limit = ApiConfig.itemLimitPerFetch,
  }) async {
    try {
      final endPoint = "posts?_start=$start&_limit=$limit";
      final response = await get(
        endPoint,
      );

      final data = response as List;

      // then convert data to ToDo objects
      return data
          .map(
            (e) => Todo.fromJson(e),
          )
          .toList();
    } catch (error) {
      rethrow;
    }
  }
}
