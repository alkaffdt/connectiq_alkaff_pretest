import 'package:connectiq_alkaff_pretest/services/api_service.dart';

extension UpdateTodoById on ApiService {
  Future<bool> updateTodoById({required Map<String, dynamic> data}) async {
    try {
      final endPoint = "posts/${data['id']}";
      final response = await put(endPoint, data: data) as Map;

      // return true if the response contains "id"
      return response.containsKey("id");
    } catch (error) {
      return false;
    }
  }
}
