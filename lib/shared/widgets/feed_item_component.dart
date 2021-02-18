import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

import 'package:rxdart/rxdart.dart';
import 'package:sil_feed/shared/type_defs/feed_type_defs.dart';
import 'package:sil_feed/shared/widgets/feed_item_action_bar.dart';

import 'package:sil_feed/shared/widgets/feed_item_body.dart';
import 'package:sil_feed/shared/widgets/feed_item_title_bar.dart';
import 'package:sil_feed/sil_feed.dart';
import 'package:sil_feed/shared/utils/colors.dart';
import 'package:sil_feed/shared/utils/text_themes.dart';
import 'package:sil_feed/shared/utils/utils.dart';
import 'package:sil_themes/spaces.dart';

import 'feed_item_comment_card.dart';

// ignore_for_file: todo
class FeedItemComponent extends StatelessWidget {
  final Map<String, dynamic> feedItem;
  final String flavour;

  /// [isAnonymousFunc] function that will be called if the current logged in user is anonymous
  /// It is not required since it's only valid for `consumer app` only
  final Function isAnonymousFunc;
  final String currentSignedInUser;

  final bool tetherThread;
  final String userReply;
  final String postedByUID;
  final String postedByName;
  final BehaviorSubject<bool> tetherThreads =
      BehaviorSubject<bool>.seeded(true);
  FeedItemComponent({
    @required this.tetherThread,
    @required this.feedItem,
    @required this.flavour,
    this.currentSignedInUser,
    @required this.isAnonymousFunc,
    @required this.hideFunction,
    @required this.pinFunction,
    @required this.resolveFunction,
    @required this.postedByUID,
    @required this.postedByName,
    @required this.isAnonymous,
    this.userReply,
  });

  // a callback to resolve an item
  final feedItemActionTypeDef resolveFunction;

  // a callback to pin an item
  final feedItemActionTypeDef pinFunction;

  // a callback to hide an item
  final feedItemActionTypeDef hideFunction;

  /// [isAnonymous] indicated whether the logged in user is iAnonymous
  final bool isAnonymous;

  @override
  Widget build(BuildContext context) {
    TextEditingController commentTextController = TextEditingController();

    /// for the [FeedItemTitleBar]
    final String feedItemID = feedItem['id'];
    final String author = feedItem['author'];
    final String tagline = feedItem['tagline'];
    final String iconUrl = feedItem['icon']['url'];
    final String timestamp =
        FeedUtils.getHumanReadableTimestamp(feedItem['timestamp']);

    /// global actions for a post
    /// - located in the bottom sheet shown the 3 dots at the title bar
    final List<dynamic> actions = feedItem['actions'] as List<dynamic>;

    /// for the [FeedItemBody]
    ///
    /// - links contain a mixture of docs, images and videos
    final List<dynamic> links = feedItem['links'] as List<dynamic>;

    // the long text
    final String text = feedItem['text'];

    // comments of a feed item
    final List<dynamic> conversations = feedItem['conversations'];
    final String postMessageTimeStamp =
        DateTime.now().toUtc().toIso8601String();

    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 2.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          smallVerticalSizedBox,
          // the title bar of the feed item
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: FeedItemTitleBar(
              author: author ?? 'Be.Well Team',
              tagline: tagline ?? 'A connected healthcare platform',
              timestamp: timestamp,
              iconUrl: iconUrl,
              itemID: feedItemID,
            ),
          ),

          // the body of the feed item
          FeedItemBody(links: links, text: text, flavour: flavour),

          /// feed item action bar
          if (actions != null && actions.isNotEmpty) ...<Widget>[
            Divider(thickness: 0.5, height: 15, color: primaryColor),
            FeedItemActionBar(
              actions: actions,
              flavour: flavour,
              feedItemID: feedItemID,
              resolveFunction: resolveFunction,
              pinFunction: pinFunction,
              hideFunction: hideFunction,
              isAnonymous: isAnonymous,
              isAnonymousFunc: isAnonymousFunc,
            ),
            Divider(thickness: 0.5, height: 10, color: primaryColor),
          ],

          if (conversations.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller: commentTextController,
                style: TextThemes.normalSize12Text(Colors.black87),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  labelText: 'Add comment',
                  labelStyle: TextThemes.normalSize12Text(Colors.grey),
                  hintStyle: TextThemes.normalSize12Text(Colors.grey),
                  suffixIcon: IconButton(
                    onPressed: () async {
                      if (commentTextController.text.isNotEmpty) {
                        final String replyTo = conversations[0]['id'];
                        final int sequenceNumber =
                            conversations[0]['sequenceNumber'];
                        final String messageReply = commentTextController.text;
                        // manager.update(userReply: messageReply);
                        commentTextController.clear();
                        // the function to reply a message to a feed item should be called here
                        final FeedComponent replyToMessage = context
                            .findAncestorWidgetOfExactType<FeedComponent>();
                        await replyToMessage.replyToFeedItemFunction(
                            replyTo: replyTo,
                            itemID: feedItemID,
                            sequenceNumber: sequenceNumber,
                            postedByName: postedByName,
                            postedByUID: postedByUID,
                            replyMessage: messageReply,
                            timestamp: postMessageTimeStamp);
                      } else {
                        Scaffold.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                            FeedUtils.snackbar(
                                content: 'You cannot post an empty reply...',
                                durationSeconds: 10),
                          );
                      }
                    },
                    icon: Icon(
                      Icons.send,
                      color: primaryColor,
                    ),
                  ),
                  hintText: 'Add comments',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor),
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor),
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                  ),
                  focusColor: primaryColor,
                ),
              ),
            ),

          if (conversations.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Comments',
                    style: TextThemes.boldSize16Text(Colors.black87),
                  )
                ],
              ),
            ),

          // show the first message others are replying to
          if (conversations.isNotEmpty)
            Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: conversations.length,
                  itemBuilder: (BuildContext context, int index) {
                    final String senderName =
                        conversations[index]['postedByName'];
                    final String threadBody = conversations[index]['text'];
                    final String replyTo = conversations[index]['replyTo'];
                    final String threadTimeStamp = DateFormat('MMM dd, yyyy')
                        .format(DateTime.parse(conversations[index]
                                ['timestamp'] ??
                            '2021-02-09T11:31:39Z'));
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        if (replyTo.isEmpty)
                          FeedItemCommentCard(
                            senderName: senderName,
                            threadBody: threadBody,
                            timeStamp: threadTimeStamp,
                          ),
                        verySmallVerticalSizedBox,
                        if (replyTo.isEmpty && conversations.isNotEmpty)
                          Row(
                            children: <Widget>[
                              Text(
                                'Replies . ',
                                style:
                                    TextThemes.boldSize13Text(Colors.black87),
                              ),
                              Text(
                                '${conversations.length - 1} replies',
                                style:
                                    TextThemes.normalSize12Text(Colors.black54),
                              ),
                            ],
                          )
                      ],
                    );
                  },
                ),
              ),
            ),

          // feed comments
          // replies from other users on this specific feed item
          if (conversations.isNotEmpty)
            StreamBuilder<bool>(
                stream: tetherThreads.stream,
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapShot) {
                  // this.manager.initial();
                  if (snapShot.data == null) {
                    return CircularProgressIndicator();
                  }
                  if (snapShot.hasData) {
                    final dynamic data = snapShot.data;

                    return Container(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 15, bottom: 10, left: 30),
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: (data == true)
                                ? conversationsLengthBuilder(
                                    conversations.length)
                                : conversations.length,
                            itemBuilder: (BuildContext context, int index) {
                              final String senderName =
                                  conversations[index]['postedByName'];
                              final String threadBody =
                                  conversations[index]['text'];
                              final String replyTo =
                                  conversations[index]['replyTo'];
                              final String threadTimeStamp =
                                  DateFormat('MMM dd, yyyy').format(
                                      DateTime.parse(conversations[index]
                                              ['timestamp'] ??
                                          '2021-02-09T11:31:39Z'));
                              return Column(
                                children: <Widget>[
                                  if (replyTo.isNotEmpty)
                                    FeedItemCommentCard(
                                      senderName: senderName,
                                      threadBody: threadBody,
                                      timeStamp: threadTimeStamp,
                                    ),
                                  smallVerticalSizedBox,
                                ],
                              );
                            }),
                      ),
                    );
                  }
                  return Container();
                }),

          if (conversations.isNotEmpty)
            StreamBuilder<bool>(
                stream: tetherThreads.stream,
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapShot) {
                  if (snapShot.data == null) {
                    return CircularProgressIndicator();
                  }
                  if (snapShot.hasData) {
                    final dynamic data = snapShot.data;
                    return Column(
                      children: <Widget>[
                        if (data == true)
                          GestureDetector(
                            onTap: () {
                              tetherThreads.add(false);
                              // this.manager.update(tetherThread: false);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  right: 15.0, bottom: 15.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    'View All Comments',
                                    style: TextThemes.boldSize12Text(
                                            Colors.black54)
                                        .copyWith(
                                            decoration:
                                                TextDecoration.underline),
                                  )
                                ],
                              ),
                            ),
                          ),
                        if (data == false)
                          GestureDetector(
                            onTap: () {
                              tetherThreads.add(true);
                              // this.manager.update(tetherThread: true);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  right: 15.0, bottom: 15.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    'Show less',
                                    style: TextThemes.boldSize12Text(
                                            Colors.black54)
                                        .copyWith(
                                            decoration:
                                                TextDecoration.underline),
                                  )
                                ],
                              ),
                            ),
                          ),
                      ],
                    );
                  }
                  return Container();
                }),

          smallVerticalSizedBox,
        ],
      ),
    );
  }
}

int conversationsLengthBuilder(int conversations) {
  int conversationsLength;
  if (conversations <= 1) {
    return conversationsLength = 1;
  } else if (conversations >= 2) {
    return conversationsLength = 2;
  }
  return conversationsLength;
}
