class ApiConfig {
  static const baseUrl = "https://jsonplaceholder.typicode.com/";
  static const Map<String, String> defaultHeaders = {
    "Content-Type": "application/json"
  };

  // timeout duration
  static const timeoutDuration = 10;

  static const itemLimitPerFetch = 10;

  static const maxItems = 100;
}
