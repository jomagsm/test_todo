import 'package:test_todo/data/server_api/server_api.dart';

class Repository {
  final _serviceApi = ServerApi();

  Future<String> login(
    String username,
    String password,
  ) async {
    try {
      final response =
          await _serviceApi.login(username: username, password: password);
      return response;
    } catch (e) {
      print(e);
      throw (e);
    }
  }
}
