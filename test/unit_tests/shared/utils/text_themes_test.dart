import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sil_feed/shared/utils/text_themes.dart';

void main() {
  test('should expect the right text styles for Text Theme', () {
    Color color;

//size 50
    expect(TextThemes.heavySize50Text(),
        TextStyle(fontWeight: FontWeight.w700, color: color, fontSize: 55));
    // size 45
    expect(TextThemes.boldSize45Text(),
        TextStyle(fontSize: 45, color: color, fontWeight: FontWeight.w500));
    // size 34
    expect(
        TextThemes.normalSize34Text(), TextStyle(fontSize: 34, color: color));

    //size 32
    expect(TextThemes.veryBoldSize32Text(),
        TextStyle(fontWeight: FontWeight.w600, color: color, fontSize: 32));

    expect(
        TextThemes.normalSize32Text(), TextStyle(fontSize: 32, color: color));

    //size 30
    expect(TextThemes.boldSize30Text(),
        TextStyle(fontSize: 30, fontWeight: FontWeight.w500, color: color));

    //size 28
    expect(TextThemes.veryBoldSize28Text(),
        TextStyle(fontWeight: FontWeight.w600, color: color, fontSize: 28));

    expect(TextThemes.heavySize28Text(),
        TextStyle(color: color, fontWeight: FontWeight.w700, fontSize: 28));

    expect(
        TextThemes.normalSize28Text(), TextStyle(fontSize: 28, color: color));

    //size 26

    expect(TextThemes.heavySize26Text(),
        TextStyle(color: color, fontWeight: FontWeight.w700, fontSize: 26));

    expect(
        TextThemes.normalSize26Text(), TextStyle(fontSize: 26, color: color));

    expect(TextThemes.boldSize26Title(),
        TextStyle(fontSize: 26, color: color, fontWeight: FontWeight.w500));

    // size 24
    expect(TextThemes.heavySize24Text(),
        TextStyle(color: color, fontWeight: FontWeight.w700, fontSize: 24));

    expect(TextThemes.mediumSize24Text(),
        TextStyle(color: color, fontWeight: FontWeight.w600, fontSize: 24));

    expect(TextThemes.boldSize24Text(),
        TextStyle(color: color, fontWeight: FontWeight.w500, fontSize: 24));

    expect(
        TextThemes.normalSize24Text(), TextStyle(color: color, fontSize: 24));

    //TextStyle(fontWeight: FontWeight.w700, color: color, fontSize: 22);

    expect(TextThemes.veryBoldSize22Text(),
        TextStyle(fontWeight: FontWeight.w600, color: color, fontSize: 22));

    expect(TextThemes.boldSize22Text(),
        TextStyle(fontWeight: FontWeight.w500, color: color, fontSize: 22));

    expect(TextThemes.mediumSize22Text(),
        TextStyle(color: color, fontWeight: FontWeight.w500, fontSize: 22));

    expect(TextThemes.normalSize22Text(),
        TextStyle(fontWeight: FontWeight.w400, color: color, fontSize: 22));

    // size 20
    expect(TextThemes.veryHeavySize20Text(),
        TextStyle(fontWeight: FontWeight.w800, color: color, fontSize: 20));

    expect(TextThemes.heavySize20Text(),
        TextStyle(fontWeight: FontWeight.w700, color: color, fontSize: 20));

    expect(TextThemes.veryBoldSize20Text(),
        TextStyle(fontWeight: FontWeight.w600, color: color, fontSize: 20));

    expect(TextThemes.boldSize20Text(),
        TextStyle(fontWeight: FontWeight.w500, color: color, fontSize: 20));

    expect(TextThemes.mediumSize20Text(),
        TextStyle(color: color, fontWeight: FontWeight.w500, fontSize: 20));

    expect(TextThemes.normalSize20Text(),
        TextStyle(fontWeight: FontWeight.w400, color: color, fontSize: 20));

    // size 18
    expect(TextThemes.heavySize18Text(),
        TextStyle(fontWeight: FontWeight.w700, color: color, fontSize: 18));

    expect(TextThemes.veryBoldSize18Text(),
        TextStyle(fontWeight: FontWeight.w600, color: color, fontSize: 18));

    expect(TextThemes.boldSize18Text(),
        TextStyle(fontWeight: FontWeight.w500, color: color, fontSize: 18));

    expect(TextThemes.normalSize18Text(),
        TextStyle(fontWeight: FontWeight.w400, color: color, fontSize: 18));

    // size 17
    expect(TextThemes.veryBoldSize17Text(),
        TextStyle(fontWeight: FontWeight.w600, color: color, fontSize: 17));

    expect(TextThemes.normalSize17Text(),
        TextStyle(fontWeight: FontWeight.w400, color: color, fontSize: 17));

    // size 16
    expect(TextThemes.heavySize16Text(),
        TextStyle(fontWeight: FontWeight.w700, color: color, fontSize: 16));

    expect(TextThemes.veryBoldSize16Text(),
        TextStyle(fontWeight: FontWeight.w600, color: color, fontSize: 16));

    expect(TextThemes.boldSize16Text(),
        TextStyle(fontWeight: FontWeight.w500, color: color, fontSize: 16));

    expect(TextThemes.normalSize16Text(),
        TextStyle(fontWeight: FontWeight.w400, color: color, fontSize: 16));

    expect(TextThemes.lightSize16Text(),
        TextStyle(fontWeight: FontWeight.w300, color: color, fontSize: 16));

    // size 15
    expect(TextThemes.veryBoldSize15Text(),
        TextStyle(fontWeight: FontWeight.w600, color: color, fontSize: 15));

    expect(TextThemes.boldSize15Text(),
        TextStyle(fontWeight: FontWeight.w500, color: color, fontSize: 15));

    expect(TextThemes.normalSize15Text(),
        TextStyle(fontWeight: FontWeight.w400, color: color, fontSize: 15));

    // size 14
    expect(TextThemes.veryHeavySize14Text(),
        TextStyle(fontWeight: FontWeight.w800, color: color, fontSize: 14));

    expect(TextThemes.heavySize14Text(),
        TextStyle(fontWeight: FontWeight.w700, color: color, fontSize: 14));

    expect(TextThemes.boldSize14Text(),
        TextStyle(fontWeight: FontWeight.w500, color: color, fontSize: 14));

    expect(TextThemes.veryBoldSize14Text(),
        TextStyle(fontWeight: FontWeight.w600, color: color, fontSize: 14));

    expect(TextThemes.normalSize14Text(),
        TextStyle(fontWeight: FontWeight.w400, color: color, fontSize: 14));

    expect(TextThemes.mediumSize14Text(),
        TextStyle(color: color, fontWeight: FontWeight.w600, fontSize: 14));
    // size 13
    expect(TextThemes.boldSize13Text(),
        TextStyle(fontWeight: FontWeight.w500, color: color, fontSize: 13));

    expect(TextThemes.normalSize13Text(),
        TextStyle(fontWeight: FontWeight.w400, color: color, fontSize: 13));

    // size 12
    expect(TextThemes.heavySize12Text(),
        TextStyle(fontWeight: FontWeight.w700, color: color, fontSize: 12));

    expect(TextThemes.veryHeavySize12Text(),
        TextStyle(fontWeight: FontWeight.w800, color: color, fontSize: 12));

    expect(TextThemes.boldSize12Text(),
        TextStyle(fontWeight: FontWeight.w500, color: color, fontSize: 12));
    expect(TextThemes.mediumSize12Text(),
        TextStyle(color: color, fontWeight: FontWeight.w400, fontSize: 10));

    expect(TextThemes.normalSize12Text(),
        TextStyle(fontWeight: FontWeight.w400, color: color, fontSize: 12));

    // size 11
    expect(TextThemes.heavySize11Text(),
        TextStyle(fontWeight: FontWeight.w700, color: color, fontSize: 11));

    expect(TextThemes.normalSize11Text(),
        TextStyle(fontWeight: FontWeight.w400, color: color, fontSize: 11));

    // size 10
    expect(TextThemes.heavySize10Text(),
        TextStyle(fontWeight: FontWeight.w700, color: color, fontSize: 10));

    expect(TextThemes.normalSize10Text(),
        TextStyle(fontWeight: FontWeight.w400, color: color, fontSize: 10));

    // size 9
    expect(TextThemes.normalSize9Text(),
        TextStyle(fontWeight: FontWeight.w400, color: color, fontSize: 9));
  });
}
