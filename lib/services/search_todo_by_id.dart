import 'package:connectiq_alkaff_pretest/models/todo_model.dart';
import 'package:connectiq_alkaff_pretest/services/api_service.dart';

extension SearchTodoById on ApiService {
  Future<List<Todo>> searchTodoById({int? searchById}) async {
    try {
      final endPoint = "posts/$searchById";
      final response = await get(
        endPoint,
      );

      // then convert data to ToDo object
      return [Todo.fromJson(response)];
    } catch (error) {
      return [];
    }
  }
}
