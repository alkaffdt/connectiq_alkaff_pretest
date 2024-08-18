import 'package:connectiq_alkaff_pretest/services/api_service.dart';

extension CreateTodo on ApiService {
  Future<bool> createTodo({required Map<String, dynamic> data}) async {
    try {
      const endPoint = "posts/";
      final response = await post(endPoint, data: data) as Map;

      // return true if the response contains "id"
      return response.containsKey("id");
    } catch (error) {
      return false;
    }
  }
}
