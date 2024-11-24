abstract class ApiController {
  Future<Map<String, dynamic>> get(
    String uri, {
    Map<String, String>? headers,
  });

  Future<Map<String, dynamic>> post(
    String uri, {
    Map<String, String>? headers,
    required Map<String, dynamic> body,
  });

  Future<Map<String, dynamic>> put(
    String uri, {
    Map<String, String>? headers,
    required Map<String, dynamic> body,
  });

  Future<Map<String, dynamic>> patch(
    String uri, {
    Map<String, String>? headers,
    required Map<String, dynamic> body,
  });

  Future<Map<String, dynamic>> delete(
    String uri, {
    Map<String, String>? headers,
    required Map<String, dynamic> body,
  });
}
