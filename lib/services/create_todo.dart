import 'package:connectiq_alkaff_pretest/models/todo_model.dart';
import 'package:connectiq_alkaff_pretest/services/api_service.dart';

extension CreateTodo on ApiService {
  Future<Todo> createTodo({required Map<String, dynamic> data}) async {
    try {
      const endPoint = "posts/";
      final response = await post(endPoint, data: data);

      // return true if the response contains "id"
      return Todo.fromJson(response);
    } catch (error) {
      rethrow;
    }
  }
}
