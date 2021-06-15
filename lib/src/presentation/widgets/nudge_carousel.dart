import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:user_feed/src/domain/entities/nudge.dart';
import 'package:user_feed/src/domain/value_objects/enums.dart';
import 'package:user_feed/src/domain/value_objects/feed_store.dart';
import 'package:user_feed/src/presentation/widgets/feed_nudge.dart';

/// [NudgeCarousel] is a carousel that receives a list of nudges and
/// displays them in the form of cards
class NudgeCarousel extends StatefulWidget {
  const NudgeCarousel({
    Key? key,
    required this.nudges,
    required this.unroll,
    required this.single,
    required this.isSmallScreen,
  }) : super(key: key);

  final bool isSmallScreen;
  final List<Nudge> nudges;

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
    final Flavour _flavour = FeedStore().flavour.valueOrNull!;

    /// if this carousel is being called independently
    final bool singleUnroll = widget.single == true && widget.unroll == true;

    /// this nudge carousel that this feed is being rendered alongside the feed
    final bool isConsumerOrSmallScreen =
        widget.isSmallScreen == true || _flavour == Flavour.CONSUMER;

    return Column(
      children: singleUnroll
          ? widget.nudges
              .map(
                (Nudge nudge) => FeedNudge(nudge: nudge),
              )
              .toList()
          : <Widget>[
              if (isConsumerOrSmallScreen)
                CarouselSlider(
                  items: widget.nudges
                      .map((Nudge nudge) => FeedNudge(nudge: nudge))
                      .toList(),
                  options: CarouselOptions(
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
                    (Nudge nudge) {
                      // the index of the nudge that is currently in view
                      final int activeNudgeIndex = widget.nudges.indexOf(nudge);
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
    );
  }
}
