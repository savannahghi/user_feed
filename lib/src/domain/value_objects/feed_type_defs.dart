// Project imports:
import 'package:user_feed/src/domain/value_objects/enums.dart';

/// a flavor and an itemId must be provided for this to work
typedef FeedItemActionTypeDef = dynamic Function(
    {required Flavour flavour, required String itemID});

typedef ReplyToFeedItemTypeDef = dynamic Function(
    {required String replyMessage,
    required String replyTo,
    required String postedByUID,
    required String itemID,
    required int sequenceNumber,
    required String postedByName,
    required String timestamp});
