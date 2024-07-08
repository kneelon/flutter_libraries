
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:libraries/library/uwi_test/model/user_model.dart';
import 'package:libraries/library/uwi_test/test/unit/user_repository.dart';
import 'package:mocktail/mocktail.dart';

//52:09
class MockHttpClient extends Mock implements Client {}

void main() {
  late UserRepository userRepository;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    userRepository = UserRepository(mockHttpClient);
  });
  group('UserRepository', () {

    group('getUser function', () {

      test('given UserRepository class when getUser function is called and status code is 200, then a UserModel should be return', () async {
        //Arrange
        when(() => mockHttpClient.get(
          Uri.parse('https://jsonplaceholder.typicode.com/users/1'),
        )).thenAnswer((invocation) async {
          return Response('''
            {
              "id": 1,
              "name": "Leanne Graham",
              "username": "Bret",
              "email": "Sincere@april.biz"
            }
          ''', 200);
        });

        //Act
        final user = await userRepository.getUser();

        //Assert
        expect(user, isA<UserModel>()); //You doesn't know the data
        //expect(user, UserModel('Darwin', 'Angeles City', 39)); //You already know the data
      });

      test('given UserRepository class when getUser function is called and status', () async {
        
        when(() => mockHttpClient.get(
          Uri.parse('https://jsonplaceholder.typicode.com/users/1'),
        )).thenAnswer((invocation) async {
          return Response('{}', 500);
        });

        final user = userRepository.getUser(); //remove await

        expect(user, throwsException);
      });
    });
  });

}