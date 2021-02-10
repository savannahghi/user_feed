import 'package:flutter_test/flutter_test.dart';
import 'package:sil_feed/shared/utils/strings.dart';

void main() {
  test('displayProgressMessage succefully', () {
    final String progress = '20';
    final String message = FeedStrings.displayProgress(progress);
    expect(message, 'Your profile is $progress% complete, complete it now');
  });
}
