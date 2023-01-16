import 'package:bloc_demo/models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Repo {
  Future<List<User>> getData() async {
    List<User> _user = [];
    const url = 'https://reqres.in/api/users?delay=1';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final json = jsonDecode(response.body)['data'];

    if (response.statusCode == 200) {
      _user = json
          .map((v) {
            return User.fromJson(v);
          })
          .cast<User>()
          .toList();
      return _user;
    } else {
      return _user;
    }
  }
}
