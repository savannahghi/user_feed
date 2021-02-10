import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sil_feed/shared/widgets/constants.dart';
import 'package:sil_feed/shared/widgets/feed_nudge.dart';

/// [NudgeCarousel] is a carousel that receives a list of nudges and
/// displays them in the form of cards
class NudgeCarousel extends StatefulWidget {
  NudgeCarousel({
    Key key,
    @required this.nudges,
    @required this.flavour,
    @required this.isAnonymous,
    this.isAnonymousFunc,
    @required this.unroll,
    @required this.single,
    @required this.isSmallScreen,
    @required this.nudgeCarouselCallbacks,
  })  : assert(() {
          if (isAnonymous != null) {
            if (isAnonymous && isAnonymousFunc == null) {
              throw Exception(
                  'when `isAnonymous` is true, `isAnonymousFunc` should not be null');
            }
          } else {
            throw Exception(' `isAnonymous`  should not be null');
          }
          return true;
        }()),
        super(key: key);

  /// the flavor in which the app is running on
  final String flavour;

  /// [isAnonymous] indicated whether the logged in user is iAnonymous
  final bool isAnonymous;

  /// [isAnonymousFunc] function that will be called if the current logged in user is anonymous
  /// It is not required since it's only valid for `consumer app` only
  final Function isAnonymousFunc;

  final bool isSmallScreen;
  final Map<String, Function> nudgeCarouselCallbacks;
  final List<dynamic> nudges;
  // whether the carousel was called indepently (as a component on its own)
  final bool single;

  /// whether to unroll the nudges
  final bool unroll;

  @override
  _NudgeCarouselState createState() => _NudgeCarouselState();
}

class _NudgeCarouselState extends State<NudgeCarousel> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final bool isConsumerOrSmallScreen =
        widget.isSmallScreen == true || widget.flavour == consumerString;
    return Container(
      width: double.infinity,
      child: Column(
        children: (widget.single == true && widget.unroll == true)

            /// this carousel is being called independently
            ? widget.nudges
                .map((dynamic nudge) => FeedNudge(
                      nudge: nudge,
                      isAnonymous: widget.isAnonymous,
                      isAnonymousFunc: widget.isAnonymousFunc,
                      flavor: widget.flavour,
                    ))
                .toList()
            : <Widget>[
                /// this nudge carousel that this feed is being rendered alongside the feed
                isConsumerOrSmallScreen
                    ? CarouselSlider(
                        items: widget.nudges
                            .map((dynamic nudge) => FeedNudge(
                                  nudge: nudge,
                                  isAnonymous: widget.isAnonymous,
                                  isAnonymousFunc: widget.isAnonymousFunc,
                                  flavor: widget.flavour,
                                ))
                            .toList(),
                        options: CarouselOptions(
                          height: 190,
                          initialPage: 0,
                          enableInfiniteScroll: false,
                          enlargeCenterPage: false,
                          scrollPhysics: BouncingScrollPhysics(),
                          viewportFraction: 1,
                          aspectRatio: 16 / 9,
                          onPageChanged:
                              (int index, CarouselPageChangedReason reason) {
                            setState(() {
                              currentIndex = index;
                            });
                          },
                        ),
                      )
                    : Container(),
                // indicator here
                if (isConsumerOrSmallScreen)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: widget.nudges.map(
                      (dynamic nudge) {
                        int index = widget.nudges.indexOf(nudge);
                        return Container(
                          key: Key(index.toString()),
                          width: 8.0,
                          height: 8.0,
                          margin: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: currentIndex == index
                                ? Theme.of(context).accentColor
                                : Colors.grey.withOpacity(0.5),
                          ),
                        );
                      },
                    ).toList(),
                  ),
              ],
      ),
    );
  }
}
