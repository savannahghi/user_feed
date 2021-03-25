/// a flavor and an itemId must be provided for this to work
typedef feedItemActionTypeDef = dynamic Function(
    {required String flavour, required String itemID});
typedef replyToFeedItemTypeDef = dynamic Function(
    {required String replyMessage,
    required String replyTo,
    required String postedByUID,
    required String itemID,
    required int sequenceNumber,
    required String postedByName,
    required String timestamp});
