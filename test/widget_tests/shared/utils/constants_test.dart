import 'package:flutter_test/flutter_test.dart';
import 'package:sil_feed/constants/constants.dart';

void main() {
  test('should return allConsumerActions', () {
    expect(allConsumerActions, <String>[
      kGetMedicine,
      kGetConsultation,
      kGetCoaching,
      kGetTest,
      kAddNHIF,
      kAddInsurance,

      // shared
      kVerifyEmail,
      kCompleteProfile,
      kResolveItem,
      kPinItem,
      kHideItem,
      kMarkSelectedItem,
    ]);
  });
}
