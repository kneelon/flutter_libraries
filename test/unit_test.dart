
import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:libraries/library/uwi_test/test/unit/user.dart';
import 'package:mockito/mockito.dart';

class MockDio extends Mock implements Dio {}

void main() {
  test('Given user with age of 24 when birthday is called Then user is old', () async {
    //Arrange
    final user = User(28, 'SomeName');

    //Act
    user.birthday();

    //Assert
    expect(user.age, 29, reason: 'Must be 29');
  });
}