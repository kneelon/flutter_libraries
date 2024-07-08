import 'package:http/http.dart' as http;
import 'package:libraries/library/uwi_test/model/user_model.dart';


class UserRepository {
  final http.Client client;
  UserRepository(this.client);

  Future<UserModel> getUser() async {
    final response = await client.get(Uri.parse('https://jsonplaceholder.typicode.com/users/1'));

    if (response.statusCode == 200) {
      return UserModel.fromJson(response.body);
    }

    throw Exception('Some Error Occurred');
  }
}