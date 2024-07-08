import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:libraries/library/uwi_test/test/unit/counter.dart';

void main() {
  //Pre-test
  // setUp(() => null);
  // setUpAll(() => null);

  //setUp is called before every test
  //setUpAll is called before all the tests

  //setUp > test1 > setUp > test2 > setUp test3
  //setUpAll > test1 > test2> test3

  group('Counter Class -', () {
    //Arrange
    late Counter counter;

    setUp(() {
      counter = Counter();
    });
    test('the value of counter class should be always zero from the first instantiated', () {
       
      //Act
      final val = counter.count;

      //Assert
      expect(val, 0, reason: 'I want the value to be zero');
    });

    test('The counter should increment by 1, every clicked', () {
  
      counter.incrementCounter();
      final val = counter.count;
      expect(val, 1);
    });

    test('The counter should be decremented by 1, every clicked', () {

      counter.decrementCounter();
      final val = counter.count;
      
      expect(val, -1);
    });

    test('The counter will reset to zero', () {
      counter.resetCounter();
    
      expect(counter.count, 0);
    });
  });

  //Post-test
  // tearDown(() => null);
  // tearDownAll(() => null);

  //tearDown called after every test
  //tearDownAll called after all the test

  //test1 > tearDown > test2 > tearDown test3 tearDown
  //test1 > test2> test3 > tearDownAll

}