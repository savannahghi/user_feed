import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sil_feed/shared/utils/text_themes.dart';

void main() {
  test('should expect the right text styles for Text Theme', () {

//size 50
    expect(
        TextThemes.heavySize50Text(),
        const TextStyle(
            fontWeight: FontWeight.w700, fontSize: 55));
    // size 45
    expect(
        TextThemes.boldSize45Text(),
        const TextStyle(
            fontSize: 45,  fontWeight: FontWeight.w500));
    // size 34
    expect(TextThemes.normalSize34Text(),
        const TextStyle(fontSize: 34, ));

    //size 32
    expect(
        TextThemes.veryBoldSize32Text(),
        const TextStyle(
            fontWeight: FontWeight.w600,  fontSize: 32));

    expect(TextThemes.normalSize32Text(),
        const TextStyle(fontSize: 32, ));

    //size 30
    expect(
        TextThemes.boldSize30Text(),
        const TextStyle(
            fontSize: 30, fontWeight: FontWeight.w500, ));

    //size 28
    expect(
        TextThemes.veryBoldSize28Text(),
        const TextStyle(
            fontWeight: FontWeight.w600,  fontSize: 28));

    expect(
        TextThemes.heavySize28Text(),
        const TextStyle(
             fontWeight: FontWeight.w700, fontSize: 28));

    expect(TextThemes.normalSize28Text(),
        const TextStyle(fontSize: 28, ));

    //size 26

    expect(
        TextThemes.heavySize26Text(),
        const TextStyle(
             fontWeight: FontWeight.w700, fontSize: 26));

    expect(TextThemes.normalSize26Text(),
        const TextStyle(fontSize: 26, ));

    expect(
        TextThemes.boldSize26Title(),
        const TextStyle(
            fontSize: 26,  fontWeight: FontWeight.w500));

    // size 24
    expect(
        TextThemes.heavySize24Text(),
        const TextStyle(
             fontWeight: FontWeight.w700, fontSize: 24));

    expect(
        TextThemes.mediumSize24Text(),
        const TextStyle(
             fontWeight: FontWeight.w600, fontSize: 24));

    expect(
        TextThemes.boldSize24Text(),
        const TextStyle(
             fontWeight: FontWeight.w500, fontSize: 24));

    expect(TextThemes.normalSize24Text(),
        const TextStyle( fontSize: 24));

    //TextStyle(fontWeight: FontWeight.w700,  fontSize: 22);

    expect(
        TextThemes.veryBoldSize22Text(),
        const TextStyle(
            fontWeight: FontWeight.w600,  fontSize: 22));

    expect(
        TextThemes.boldSize22Text(),
        const TextStyle(
            fontWeight: FontWeight.w500,  fontSize: 22));

    expect(
        TextThemes.mediumSize22Text(),
        const TextStyle(
             fontWeight: FontWeight.w500, fontSize: 22));

    expect(
        TextThemes.normalSize22Text(),
        const TextStyle(
            fontWeight: FontWeight.w400,  fontSize: 22));

    // size 20
    expect(
        TextThemes.veryHeavySize20Text(),
        const TextStyle(
            fontWeight: FontWeight.w800,  fontSize: 20));

    expect(
        TextThemes.heavySize20Text(),
        const TextStyle(
            fontWeight: FontWeight.w700,  fontSize: 20));

    expect(
        TextThemes.veryBoldSize20Text(),
        const TextStyle(
            fontWeight: FontWeight.w600,  fontSize: 20));

    expect(
        TextThemes.boldSize20Text(),
        const TextStyle(
            fontWeight: FontWeight.w500,  fontSize: 20));

    expect(
        TextThemes.mediumSize20Text(),
        const TextStyle(
             fontWeight: FontWeight.w500, fontSize: 20));

    expect(
        TextThemes.normalSize20Text(),
        const TextStyle(
            fontWeight: FontWeight.w400,  fontSize: 20));

    // size 18
    expect(
        TextThemes.heavySize18Text(),
        const TextStyle(
            fontWeight: FontWeight.w700,  fontSize: 18));

    expect(
        TextThemes.veryBoldSize18Text(),
        const TextStyle(
            fontWeight: FontWeight.w600,  fontSize: 18));

    expect(
        TextThemes.boldSize18Text(),
        const TextStyle(
            fontWeight: FontWeight.w500,  fontSize: 18));

    expect(
        TextThemes.normalSize18Text(),
        const TextStyle(
            fontWeight: FontWeight.w400,  fontSize: 18));

    // size 17
    expect(
        TextThemes.veryBoldSize17Text(),
        const TextStyle(
            fontWeight: FontWeight.w600,  fontSize: 17));

    expect(
        TextThemes.normalSize17Text(),
        const TextStyle(
            fontWeight: FontWeight.w400,  fontSize: 17));

    // size 16
    expect(
        TextThemes.heavySize16Text(),
        const TextStyle(
            fontWeight: FontWeight.w700,  fontSize: 16));

    expect(
        TextThemes.veryBoldSize16Text(),
        const TextStyle(
            fontWeight: FontWeight.w600,  fontSize: 16));

    expect(
        TextThemes.boldSize16Text(),
        const TextStyle(
            fontWeight: FontWeight.w500,  fontSize: 16));

    expect(
        TextThemes.normalSize16Text(),
        const TextStyle(
            fontWeight: FontWeight.w400,  fontSize: 16));

    expect(
        TextThemes.lightSize16Text(),
        const TextStyle(
            fontWeight: FontWeight.w300,  fontSize: 16));

    // size 15
    expect(
        TextThemes.veryBoldSize15Text(),
        const TextStyle(
            fontWeight: FontWeight.w600,  fontSize: 15));

    expect(
        TextThemes.boldSize15Text(),
        const TextStyle(
            fontWeight: FontWeight.w500,  fontSize: 15));

    expect(
        TextThemes.normalSize15Text(),
        const TextStyle(
            fontWeight: FontWeight.w400,  fontSize: 15));

    // size 14
    expect(
        TextThemes.veryHeavySize14Text(),
        const TextStyle(
            fontWeight: FontWeight.w800,  fontSize: 14));

    expect(
        TextThemes.heavySize14Text(),
        const TextStyle(
            fontWeight: FontWeight.w700,  fontSize: 14));

    expect(
        TextThemes.boldSize14Text(),
        const TextStyle(
            fontWeight: FontWeight.w500,  fontSize: 14));

    expect(
        TextThemes.veryBoldSize14Text(),
        const TextStyle(
            fontWeight: FontWeight.w600,  fontSize: 14));

    expect(
        TextThemes.normalSize14Text(),
        const TextStyle(
            fontWeight: FontWeight.w400,  fontSize: 14));

    expect(
        TextThemes.mediumSize14Text(),
        const TextStyle(
             fontWeight: FontWeight.w600, fontSize: 14));
    // size 13
    expect(
        TextThemes.boldSize13Text(),
        const TextStyle(
            fontWeight: FontWeight.w500,  fontSize: 13));

    expect(
        TextThemes.normalSize13Text(),
        const TextStyle(
            fontWeight: FontWeight.w400,  fontSize: 13));

    // size 12
    expect(
        TextThemes.heavySize12Text(),
        const TextStyle(
            fontWeight: FontWeight.w700,  fontSize: 12));

    expect(
        TextThemes.veryHeavySize12Text(),
        const TextStyle(
            fontWeight: FontWeight.w800,  fontSize: 12));

    expect(
        TextThemes.boldSize12Text(),
        const TextStyle(
            fontWeight: FontWeight.w500,  fontSize: 12));
    expect(
        TextThemes.mediumSize12Text(),
        const TextStyle(
             fontWeight: FontWeight.w400, fontSize: 10));

    expect(
        TextThemes.normalSize12Text(),
        const TextStyle(
            fontWeight: FontWeight.w400,  fontSize: 12));

    // size 11
    expect(
        TextThemes.heavySize11Text(),
        const TextStyle(
            fontWeight: FontWeight.w700,  fontSize: 11));

    expect(
        TextThemes.normalSize11Text(),
        const TextStyle(
            fontWeight: FontWeight.w400,  fontSize: 11));

    // size 10
    expect(
        TextThemes.heavySize10Text(),
        const TextStyle(
            fontWeight: FontWeight.w700,  fontSize: 10));

    expect(
        TextThemes.normalSize10Text(),
        const TextStyle(
            fontWeight: FontWeight.w400,  fontSize: 10));

    // size 9
    expect(
        TextThemes.normalSize9Text(),
        const TextStyle(
            fontWeight: FontWeight.w400,  fontSize: 9));
  });
}
