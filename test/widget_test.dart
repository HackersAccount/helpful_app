// import 'package:flutter_driver/flutter_driver.dart';
// import 'package:test/test.dart';

// void main() {
//   group('Converter App', () {
//     FlutterDriver driver;

//     setUpAll(() async {
//       driver = await FlutterDriver.connect();
//     });

//     tearDownAll(() async {
//       if (driver != null) {
//         driver.close();
//       }
//     });

//     test('Convert ZIG to USD', () async {
//       final zingInput = find.byValueKey('zig_input');
//       final usdInput = find.byValueKey('usd_input');

//       await driver.tap(zingInput);
//       await driver.enterText('100'); // Input ZIG amount
//       await driver.waitFor(find.text('100')); // Verify inputted ZIG amount

//       await driver.tap(usdInput);
//       await driver.enterText('1356'); // Input USD amount
//       await driver.waitFor(find.text('1356')); // Verify inputted USD amount

//       // Wait for the conversion to take effect
//       await Future.delayed(Duration(seconds: 1));

//       // Verify converted values
//       expect(await driver.getText(zingInput), '7.39');
//       expect(await driver.getText(usdInput), '1356');
//     });
//   });
// }
