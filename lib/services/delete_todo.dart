import 'package:connectiq_alkaff_pretest/services/api_service.dart';

extension DeleteTodoById on ApiService {
  Future<bool> deleteTodoById(int todoId) async {
    try {
      final endPoint = "posts/$todoId";
      final response = await delete(
        endPoint,
      );

      // as long the status code is 2xx then return true
      return true;
    } catch (error) {
      return false;
    }
  }
}
