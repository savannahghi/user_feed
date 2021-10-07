// Flutter imports:
import 'package:flutter/foundation.dart';

/// [Handling]
enum Handling {
  INLINE,
  FULL_PAGE,
  UNKNOWN,
}

/// [HandlingEx] extends [Handling] enum to get the values as
/// strings
extension HandlingEx on Handling {
  String get name {
    return describeEnum(this).toUpperCase();
  }
}

/// [ActionType]
enum ActionType {
  PRIMARY,
  SECONDARY,
  OVERFLOW,
  FLOATING,
  TERTIARY,
  GLOBAL,
  UNKNOWN
}

/// [ActionTypeEx] extends [ActionType] enum to get the values as
/// strings
extension ActionTypeEx on ActionType {
  String get name {
    return describeEnum(this).toUpperCase();
  }
}

/// [LinkType]

enum LinkType { YOUTUBE_VIDEO, PNG_IMAGE, PDF_DOCUMENT, SVG_IMAGE, UNKNOWN }

/// [LinkTypeEx] extends [LinkType] enum to get the values as
/// strings
extension LinkTypeEx on LinkType {
  String get name {
    return describeEnum(this).toUpperCase();
  }
}

/// [Channel]
enum Channel { FCM, EMAIL, SMS, WHATSAPP, UNKNOWN }

/// [ChannelEx] extends [Channel] enum to get the values as
/// strings
extension ChannelEx on Channel {
  String get name {
    return describeEnum(this).toUpperCase();
  }
}

/// [Flavour]
enum Flavour { CONSUMER, PRO, UNKNOWN }

/// [FlavourEx] extends [Flavour] enum to get the values as
/// strings
extension FlavourEx on Flavour {
  String get name {
    return describeEnum(this).toUpperCase();
  }
}

/// [Visibility]
enum Visibility { SHOW, HIDE, UNKNOWN }

/// [VisibilityEx] extends [Visibility] enum to get the values as
/// strings
extension VisibilityEx on Visibility {
  String get name {
    return describeEnum(this).toUpperCase();
  }
}

/// [Status]
enum Status { PENDING, IN_PROGRESS, DONE, UNKNOWN }

/// [StatusEx] extends [Status] enum to get the values as
/// strings
extension StatusEx on Status {
  String get name {
    return describeEnum(this).toUpperCase();
  }
}

/// [TextType]
enum TextType { HTML, MARKDOWN, PLAIN, UNKNOWN }

/// [StatusEx] extends [Status] enum to get the values as
/// strings
extension TextTypeEx on TextType {
  String get name {
    return describeEnum(this).toUpperCase();
  }
}
