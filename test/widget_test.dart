import 'package:flutter_test/flutter_test.dart';
import 'package:singlish_writer/logic/translater_logic.dart';

void main() {
  test('TranslaterLogic basic test', () {
    final logic = TranslaterLogic();
    expect(logic.convertText('api'), 'අපි');
    expect(logic.convertText('meika'), 'මේක');
  });
}
