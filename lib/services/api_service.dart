import 'dart:async';
import 'dart:convert';
import 'package:connectiq_alkaff_pretest/cores/configs/api_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final apiServiceProvider = Provider<ApiService>((ref) {
  return ApiService();
});

class ApiService {
  Future<dynamic> get(String endpoint) async {
    try {
      final response = await http
          .get(Uri.parse('${ApiConfig.baseUrl}$endpoint'),
              headers: ApiConfig.defaultHeaders)
          .timeout(const Duration(seconds: ApiConfig.timeoutDuration));

      return _handleResponse(response);
    } catch (e) {
      // Handle error (network issues, timeout, etc.)
      return _handleError(e);
    }
  }

  Future<dynamic> post(String endpoint,
      {Map<String, dynamic> data = const {}}) async {
    try {
      final response = await http
          .post(Uri.parse('${ApiConfig.baseUrl}$endpoint'),
              headers: ApiConfig.defaultHeaders, body: json.encode(data))
          .timeout(const Duration(seconds: ApiConfig.timeoutDuration));

      return _handleResponse(response);
    } catch (e) {
      return _handleError(e);
    }
  }

  dynamic _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      // Successfully got a response
      return json.decode(response.body);
    } else {
      // Handle non-200 responses
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }

  dynamic _handleError(dynamic error) {
    // Handle error scenarios, logging, or returning specific error messages
    if (error is http.ClientException) {
      throw Exception('Network error occurred');
    } else if (error is TimeoutException) {
      throw Exception('Request timed out');
    } else {
      throw Exception('An unexpected error occurred');
    }
  }
}
