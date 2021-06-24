import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:user_feed/src/domain/value_objects/constants.dart';
import 'package:user_feed/src/domain/value_objects/feed_store.dart';
import 'package:user_feed/src/domain/value_objects/strings.dart';
import 'package:user_feed/src/domain/value_objects/widget_keys.dart';

class CoverMiniCard extends StatelessWidget {
  CoverMiniCard({Key? key, required this.cover}) : super(key: key);
  final dynamic cover;

  final Map<String, Function>? coverCallbacks =
      FeedStore().feedContentCallbacks.valueOrNull;

  @override
  Widget build(BuildContext context) {
    final BoxDecoration decoration = BoxDecoration(
      color: Colors.black.withOpacity(0.1),
      shape: BoxShape.circle,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(20),
          color: Colors.white,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                yourVirtualCard,
                style: TextThemes.boldSize14Text(Colors.black),
              ),
              Text(
                tapToView,
                style: TextThemes.normalSize12Text(Colors.black)
                    .copyWith(fontSize: 13),
              ),
            ],
          ),
        ),
        GestureDetector(
          key: miniCardKey,
          onTap: () {
            coverCallbacks![kViewCover]!();
          },
          child: Container(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            width: double.infinity,
            height: 200,
            color: Colors.white,
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: -400,
                    top: -400,
                    child: Opacity(
                      opacity: 0.7,
                      child: Container(
                        width: 600,
                        height: 600,
                        decoration: decoration,
                      ),
                    ),
                  ),
                  Positioned(
                    right: -170,
                    bottom: -170,
                    child: Container(
                      width: 300,
                      height: 300,
                      decoration: decoration,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(35),
                          child: SvgPicture.asset(
                            miniCardLogo,
                            width: 80,
                            height: 80,
                            package: packageName,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          cover.payerName as String,
                          style: TextThemes.boldSize16Text(Colors.white),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              memberNumber,
                              style: TextThemes.lightSize16Text(Colors.white)
                                  .copyWith(fontSize: 12),
                            ),
                            Text(
                              cover.memberNumber as String,
                              style: TextThemes.boldSize14Text(Colors.white),
                            ),
                            mediumVerticalSizedBox,
                            Text(
                              nameOfInsured,
                              style: TextThemes.lightSize16Text(Colors.white)
                                  .copyWith(fontSize: 12),
                            ),
                            Text(
                              cover.memberName as String,
                              style: TextThemes.boldSize14Text(Colors.white),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
