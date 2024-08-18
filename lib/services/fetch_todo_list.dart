import 'package:connectiq_alkaff_pretest/cores/configs/api_config.dart';
import 'package:connectiq_alkaff_pretest/models/todo_model.dart';
import 'package:connectiq_alkaff_pretest/services/api_service.dart';

extension FetchTodoList on ApiService {
  Future<List<Todo>> fetchTodoList(
      {required int start,
      int limit = ApiConfig.itemLimitPerFetch,
      int? searchById}) async {
    try {
      final searchByIdParam = searchById != null ? "/$searchById" : "";
      final endPoint = "posts?_start=$start&_limit=$limit$searchByIdParam";
      final response = await get(
        endPoint,
      );

      final data = response as List;

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
