import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sil_feed/constants/constants.dart';
import 'package:sil_feed/shared/widgets/feed_nudge.dart';

/// [NudgeCarousel] is a carousel that receives a list of nudges and
/// displays them in the form of cards
class NudgeCarousel extends StatefulWidget {
  NudgeCarousel({
    Key? key,
    required this.nudges,
    required this.flavour,
    required this.isAnonymous,
    this.isAnonymousFunc,
    required this.unroll,
    required this.single,
    required this.isSmallScreen,
    required this.nudgeCarouselCallbacks,
  })   : assert(() {
          if (isAnonymous && isAnonymousFunc == null) {
            throw Exception(
                'when `isAnonymous` is true, `isAnonymousFunc` should not be null');
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
  final Function? isAnonymousFunc;

  final bool isSmallScreen;
  final Map<String, Function> nudgeCarouselCallbacks;
  final List<dynamic> nudges;
  // whether the carousel was called independently (as a component on its own)
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
    /// if this carousel is being called independently
    final bool singleUnroll = widget.single == true && widget.unroll == true;

    /// this nudge carousel that this feed is being rendered alongside the feed
    final bool isConsumerOrSmallScreen =
        widget.isSmallScreen == true || widget.flavour == consumerFlavor;

    // TODO(abiud): anticipate empty nudges. this might involve a zero state
    // if (widget.nudges.isEmpty) return Container();

    return SizedBox(
      width: double.infinity,
      child: Column(
        children: singleUnroll
            ? widget.nudges
                .map((dynamic nudge) => FeedNudge(
                      nudge: nudge as Map<String, dynamic>,
                      isAnonymous: widget.isAnonymous,
                      isAnonymousFunc: widget.isAnonymousFunc!,
                      flavor: widget.flavour,
                    ))
                .toList()
            : <Widget>[
                if (isConsumerOrSmallScreen)
                  CarouselSlider(
                    items: widget.nudges
                        .map((dynamic nudge) => FeedNudge(
                              nudge: nudge as Map<String, dynamic>,
                              isAnonymous: widget.isAnonymous,
                              isAnonymousFunc: widget.isAnonymousFunc!,
                              flavor: widget.flavour,
                            ))
                        .toList(),
                    options: CarouselOptions(
                      height: 190,
                      enableInfiniteScroll: false,
                      scrollPhysics: const BouncingScrollPhysics(),
                      viewportFraction: 1,
                      onPageChanged:
                          (int index, CarouselPageChangedReason reason) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                    ),
                  )
                else
                  Container(),
                // indicator here
                if (isConsumerOrSmallScreen)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: widget.nudges.map(
                      (dynamic nudge) {
                        // the index of the nudge that is currently in view
                        final int activeNudgeIndex =
                            widget.nudges.indexOf(nudge);
                        return Container(
                          key: Key(activeNudgeIndex.toString()),
                          width: 8.0,
                          height: 8.0,
                          margin: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: currentIndex == activeNudgeIndex
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
