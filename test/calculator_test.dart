import 'package:libraries/library/uwi_test/test/unit/calculator.dart';
import 'package:test/test.dart';

void main() {

  test('the calculator returns 4 when adding 2 and 2', () {
    //1st step setup -> create the calculator object
    final calculator = Calculator();

    //2nd step: side effects -> collect the result you want to test
    final result = calculator.add(2, 2);

    //3rd step: expectations -> compare the result against an expected value
    expect(result, 4, reason: 'It should be exactly 4');
  });
}