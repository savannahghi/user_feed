import 'package:flutter_test/flutter_test.dart';
import 'package:user_feed/src/domain/value_objects/enums.dart';

void main() {
  group('Enum', () {
    test(
      'should describeEnum',
      () {
        expect(Handling.FULL_PAGE.name, 'FULL_PAGE');
        expect(Handling.INLINE.name, 'INLINE');
        expect(ActionType.PRIMARY.name, 'PRIMARY');
        expect(ActionType.SECONDARY.name, 'SECONDARY');
        expect(LinkType.YOUTUBE_VIDEO.name, 'YOUTUBE_VIDEO');
        expect(Channel.SMS.name, 'SMS');
        expect(Flavour.PRO.name, 'PRO');
        expect(Visibility.SHOW.name, 'SHOW');
        expect(Status.IN_PROGRESS.name, 'IN_PROGRESS');
        expect(TextType.MARKDOWN.name, 'MARKDOWN');
      },
    );
  });
}
