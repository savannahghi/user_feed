import 'package:sil_feed/src/domain/entities/action.dart';
import 'package:sil_feed/src/domain/entities/feed.dart';
import 'package:sil_feed/src/domain/entities/item.dart';
import 'package:sil_feed/src/domain/entities/link.dart';
import 'package:sil_feed/src/domain/entities/nudge.dart';

const String author = 'Be.Well Team';
const String iconUrl = 'https://assets.healthcloud.co.ke/bewell_logo.png';
const String itemID = '1ns2oDTr800KQMoAwlyS18DiHnp';
const String tagline = 'Welcome to Be.Well';
const String timestamp = '2021-02-01T07:30:50Z';

final List<Nudge> mockFeedNudges = <Nudge>[mockNudge1, mockNudge2];

final Nudge mockNudge1 = Nudge.fromJson(mockNudgeData1);

final Nudge mockNudge2 = Nudge.fromJson(mockNudgeData2);

final List<Link> mockFeedLinks = <Link>[
  mockYoutubeVideoLink,
  mockImageLink,
  mockPdfLink
];

final List<Link> mockMultipleFeedLinks = <Link>[
  mockYoutubeVideoLink,
  mockImageLink,
  mockImageLink,
  mockImageLink,
  mockPdfLink
];

final Map<String, dynamic> mockNudgeData1 = <String, dynamic>{
  'id': '1608729954',
  'sequenceNumber': 1608729964,
  'visibility': 'SHOW',
  'status': 'PENDING',
  'title': 'Complete your rider KYC',
  'text': 'Fill in your Be.Well business KYC in order to start transacting',
  'actions': <dynamic>[
    <String, dynamic>{
      'id': '1608647889',
      'sequenceNumber': 1608647899,
      'name': 'COMPLETE_INDIVIDUAL_RIDER_KYC',
      'actionType': 'PRIMARY',
      'handling': 'FULL_PAGE',
      'allowAnonymous': false
    }
  ],
  'links': <dynamic>[
    <String, dynamic>{
      'id': '1ns2o8pktkMsAEmP9dIKFvIhvAC',
      'url': 'https://youtu.be/gcv2Z2AdpjM',
      'linkType': 'YOUTUBE_VIDEO',
      'thumbnail':
          'https://assets.healthcloud.co.ke/items/videos/thumbs/01_lead.png',
      'title': 'Be.Well lead'
    },
    <String, dynamic>{
      'id': '1ns2o9kdNr1wyAyuybtsr9VQSs8',
      'url': 'https://youtu.be/W_daZjDET9Q',
      'linkType': 'YOUTUBE_VIDEO',
      'thumbnail':
          'https://assets.healthcloud.co.ke/items/videos/thumbs/02_prescription.png',
      'title': 'Prescription delivery'
    },
    <String, dynamic>{
      'id': '1ns2oAO0lVcn7gzAqBZrICZCMr2',
      'url':
          'https://assets.healthcloud.co.ke/items/images/bewell_banner05.png',
      'linkType': 'PNG_IMAGE',
      'title': 'Wellness review',
      'description': 'You should have a wellness review daily',
      'thumbnail':
          'https://assets.healthcloud.co.ke/items/images/thumbs/bewell_banner05.png'
    },
    <String, dynamic>{
      'id': '1ns2o6JDMlUMtTcwPU2MqvAW5VR',
      'url':
          'https://assets.healthcloud.co.ke/items/images/bewell_banner06.png',
      'linkType': 'PNG_IMAGE',
      'title': 'Wellness review',
      'description': 'You should have a wellness review daily',
      'thumbnail':
          'https://assets.healthcloud.co.ke/items/images/thumbs/bewell_banner06.png'
    },
    <String, dynamic>{
      'id': '1ns2o9GsFxyltGcAQg6mufS1lAD',
      'url':
          'https://assets.healthcloud.co.ke/items/documents/bewell_banner_27.pdf',
      'linkType': 'PDF_DOCUMENT',
      'title': 'Need to refill your meds?',
      'description': 'We will deliver',
      'thumbnail':
          'https://assets.healthcloud.co.ke/items/documents/thumbs/bewell_banner_27.png'
    },
  ],
};

final Map<String, dynamic> mockNudgeData2 = <String, dynamic>{
  'id': '1608729973',
  'sequenceNumber': 1608729973,
  'visibility': 'SHOW',
  'status': 'PENDING',
  'title': 'Complete',
  'text': 'Fill in your Be.Well business KYC in order to start transacting',
  'actions': <dynamic>[
    <String, dynamic>{
      'id': '1608647089',
      'sequenceNumber': 1608647089,
      'name': 'COMPLETE_INDIVIDUAL_RIDER_KYC',
      'actionType': 'PRIMARY',
      'handling': 'FULL_PAGE',
      'allowAnonymous': false
    }
  ],
  'links': <dynamic>[
    <String, dynamic>{
      'id': '1ns2o8pktkMsAEmP9dIKFvIhvAC',
      'url': 'https://youtu.be/gcv2Z2AdpjM',
      'linkType': 'YOUTUBE_VIDEO',
      'thumbnail':
          'https://assets.healthcloud.co.ke/items/videos/thumbs/01_lead.png',
      'title': 'Be.Well lead'
    },
    <String, dynamic>{
      'id': '1ns2o9kdNr1wyAyuybtsr9VQSs8',
      'url': 'https://youtu.be/W_daZjDET9Q',
      'linkType': 'YOUTUBE_VIDEO',
      'thumbnail':
          'https://assets.healthcloud.co.ke/items/videos/thumbs/02_prescription.png',
      'title': 'Prescription delivery'
    },
    <String, dynamic>{
      'id': '1ns2oAO0lVcn7gzAqBZrICZCMr2',
      'url':
          'https://assets.healthcloud.co.ke/items/images/bewell_banner05.png',
      'linkType': 'PNG_IMAGE',
      'title': 'Wellness review',
      'description': 'You should have a wellness review daily',
      'thumbnail':
          'https://assets.healthcloud.co.ke/items/images/thumbs/bewell_banner05.png'
    },
    <String, dynamic>{
      'id': '1ns2o6JDMlUMtTcwPU2MqvAW5VR',
      'url':
          'https://assets.healthcloud.co.ke/items/images/bewell_banner06.png',
      'linkType': 'PNG_IMAGE',
      'title': 'Wellness review',
      'description': 'You should have a wellness review daily',
      'thumbnail':
          'https://assets.healthcloud.co.ke/items/images/thumbs/bewell_banner06.png'
    },
    <String, dynamic>{
      'id': '1ns2o9GsFxyltGcAQg6mufS1lAD',
      'url':
          'https://assets.healthcloud.co.ke/items/documents/bewell_banner_27.pdf',
      'linkType': 'PDF_DOCUMENT',
      'title': 'Need to refill your meds?',
      'description': 'We will deliver',
      'thumbnail':
          'https://assets.healthcloud.co.ke/items/documents/thumbs/bewell_banner_27.png'
    },
  ],
};

final List<Action> mockFeedItemActions = <Action>[
  Action.fromJson(
    <String, dynamic>{
      'id': '1oBxEPUVwchV3RPYK37QmywsNq4',
      'sequenceNumber': 1,
      'name': 'RESOLVE_ITEM',
      'actionType': 'PRIMARY',
      'handling': 'INLINE',
      'allowAnonymous': false,
      'icon': <String, dynamic>{
        'id': '1ns2oDTr800KQMoAwlyS18DiHnp',
        'url': 'https://assets.healthcloud.co.ke/bewell_logo.png',
        'linkType': 'PNG_IMAGE'
      },
    },
  ),
  Action.fromJson(
    <String, dynamic>{
      'id': '1oBxEPUVwchV3RPYK37QmywsNq4',
      'sequenceNumber': 1,
      'name': 'HIDE_ITEM',
      'actionType': 'PRIMARY',
      'handling': 'INLINE',
      'allowAnonymous': false,
      'icon': <String, dynamic>{
        'id': '1ns2oDTr800KQMoAwlyS18DiHnp',
        'url': 'https://assets.healthcloud.co.ke/bewell_logo.png',
        'linkType': 'PNG_IMAGE'
      },
    },
  ),
  Action.fromJson(
    <String, dynamic>{
      'id': '1oBxEPUVwchV3RPYK37QmywsNq4',
      'sequenceNumber': 1,
      'name': 'PIN_ITEM',
      'actionType': 'PRIMARY',
      'handling': 'INLINE',
      'allowAnonymous': false,
      'icon': <String, dynamic>{
        'id': '1ns2oDTr800KQMoAwlyS18DiHnp',
        'url': 'https://assets.healthcloud.co.ke/bewell_logo.png',
        'linkType': 'PNG_IMAGE'
      },
    },
  )
];

final List<Action> mockFeedItemHideActions = <Action>[
  Action.fromJson(
    <String, dynamic>{
      'id': '1oBxEPUVwchV3RPYK37QmywsNq4',
      'sequenceNumber': 1,
      'name': 'HIDE_ITEM',
      'actionType': 'PRIMARY',
      'handling': 'INLINE',
      'allowAnonymous': false
    },
  )
];

final Link mockYoutubeVideoLink = Link.fromJson(
  <String, String>{
    'id': '1lmN7huRFi1PTCNIejxPQXy7KkC',
    'url': 'https://www.youtube.com/watch?v=gcv2Z2AdpjM',
    'linkType': 'YOUTUBE_VIDEO',
    'title': 'Be.Well lead',
    'description': 'Introducing Be.Well by Slade 360',
    'thumbnail':
        'https://assets.healthcloud.co.ke/items/videos/thumbs/01_lead.png'
  },
);

final Link mockImageLink = Link.fromJson(
  <String, String>{
    'id': '1lmN7WFfyzVZ27bar4mh5ffAP2K',
    'url': 'https://assets.healthcloud.co.ke/nudges/verify_email.png',
    'linkType': 'PNG_IMAGE'
  },
);

final Link mockPdfLink = Link.fromJson(
  <String, String>{
    'id': '1lmN7abgnxZsJZsfUxke6Kxo3eL',
    'url':
        'https://assets.healthcloud.co.ke/items/documents/bewell_banner_29.pdf',
    'linkType': 'PDF_DOCUMENT',
    'title': 'How do you get your kids to take meds?',
    'description': 'Do you negotiate or introduce Kiboko the motivator?',
    'thumbnail':
        'https://assets.healthcloud.co.ke/items/documents/thumbs/bewell_banner_29.png'
  },
);

final Action mockFeedPrimaryAction = Action.fromJson(
  <String, dynamic>{
    'id': '1lmN7ZKSVsJqfZ0gSJzFGExstWX',
    'name': 'VERIFY_EMAIL',
    'actionType': 'PRIMARY',
    'handling': 'FULL_PAGE',
    'allowAnonymous': true
  },
);

final Action mockFeedSecondaryAction = Action.fromJson(
  <String, dynamic>{
    'id': '1lmN7ZKSVsJqfZ0gSJzFGExstWX',
    'name': 'VERIFY_EMAIL',
    'actionType': 'SECONDARY',
    'handling': 'FULL_PAGE',
    'allowAnonymous': false,
    'nudgeCallbacks': <String, dynamic>{
      ' kCompleteIndividualRiderKYC': '445212'
    }
  },
);

final Action mockFeedOverflowAction = Action.fromJson(
  <String, dynamic>{
    'id': '1lmN7ZKSVsJqfZ0gSJzFGExstWX',
    'name': 'VERIFY_EMAIL',
    'actionType': 'OVERFLOW',
    'handling': 'FULL_PAGE',
    'allowAnonymous': false
  },
);

final Action mockFeedAction = Action.fromJson(
  <String, dynamic>{
    'id': '1ns2o0A6DumWaWAInYOruVnr1QE',
    'sequenceNumber': 1,
    'name': 'SEARCH_PATIENT',
    'actionType': 'SECONDARY',
    'handling': 'FULL_PAGE',
    'allowAnonymous': false
  },
);

final Nudge nudge = Nudge.fromJson(
  <String, dynamic>{
    'id': '1608729954',
    'sequenceNumber': 1608729964,
    'visibility': 'SHOW',
    'status': 'PENDING',
    'title': 'Complete your rider KYC',
    'text': 'Fill in your Be.Well business KYC in order to start transacting',
    'actions': <dynamic>[
      <String, dynamic>{
        'id': '1608647889',
        'sequenceNumber': 1608647899,
        'name': 'COMPLETE_INDIVIDUAL_RIDER_KYC',
        'actionType': 'PRIMARY',
        'handling': 'FULL_PAGE',
        'allowAnonymous': false
      }
    ],
    'links': <dynamic>[
      <String, dynamic>{
        'id': '1ns2o8pktkMsAEmP9dIKFvIhvAC',
        'url': 'https://youtu.be/gcv2Z2AdpjM',
        'linkType': 'YOUTUBE_VIDEO',
        'thumbnail':
            'https://assets.healthcloud.co.ke/items/videos/thumbs/01_lead.png',
        'title': 'Be.Well lead'
      },
      <String, dynamic>{
        'id': '1ns2o9kdNr1wyAyuybtsr9VQSs8',
        'url': 'https://youtu.be/W_daZjDET9Q',
        'linkType': 'YOUTUBE_VIDEO',
        'thumbnail':
            'https://assets.healthcloud.co.ke/items/videos/thumbs/02_prescription.png',
        'title': 'Prescription delivery'
      },
      <String, dynamic>{
        'id': '1ns2oAO0lVcn7gzAqBZrICZCMr2',
        'url':
            'https://assets.healthcloud.co.ke/items/images/bewell_banner05.png',
        'linkType': 'PNG_IMAGE',
        'title': 'Wellness review',
        'description': 'You should have a wellness review daily',
        'thumbnail':
            'https://assets.healthcloud.co.ke/items/images/thumbs/bewell_banner05.png'
      },
    ],
  },
);

final Item mockFeedItem = Item.fromJson(
  mockItemData,
);

final Map<String, dynamic> mockItemData = <String, dynamic>{
  'id': '1ns2oCuWbdA67Qv94XNRM3IXejh',
  'sequenceNumber': 1,
  'expiry': '2121-04-18T07:30:50Z',
  'persistent': true,
  'status': 'PENDING',
  'visibility': 'SHOW',
  'label': 'WELCOME',
  'name': 'RESOLVE_ITEM',
  'icon': <String, dynamic>{
    'id': '1ns2oDTr800KQMoAwlyS18DiHnp',
    'url': iconUrl,
    'linkType': 'PNG_IMAGE'
  },
  'itemID': itemID,
  'author': author,
  'tagline': tagline,
  'timestamp': timestamp,
  'summary': 'What is Be.Well?',
  'text':
      'Be.Well is a virtual and physical healthcare community. Our goal is to make it easy for you to provide affordable high-quality healthcare - whether online or in person.',
  'links': <Map<String, dynamic>>[
    <String, dynamic>{
      'id': '1ns2o8pktkMsAEmP9dIKFvIhvAC',
      'url': 'https://youtu.be/gcv2Z2AdpjM',
      'linkType': 'YOUTUBE_VIDEO',
      'thumbnail':
          'https://assets.healthcloud.co.ke/items/videos/thumbs/01_lead.png',
      'title': 'Be.Well lead'
    },
    <String, dynamic>{
      'id': '1ns2o9kdNr1wyAyuybtsr9VQSs8',
      'url': 'https://youtu.be/W_daZjDET9Q',
      'linkType': 'YOUTUBE_VIDEO',
      'thumbnail':
          'https://assets.healthcloud.co.ke/items/videos/thumbs/02_prescription.png',
      'title': 'Prescription delivery'
    },
    <String, dynamic>{
      'id': '1ns2oAO0lVcn7gzAqBZrICZCMr2',
      'url':
          'https://assets.healthcloud.co.ke/items/images/bewell_banner05.png',
      'linkType': 'PNG_IMAGE',
      'title': 'Wellness review',
      'description': 'You should have a wellness review daily',
      'thumbnail':
          'https://assets.healthcloud.co.ke/items/images/thumbs/bewell_banner05.png'
    },
    <String, dynamic>{
      'id': '1ns2o6JDMlUMtTcwPU2MqvAW5VR',
      'url':
          'https://assets.healthcloud.co.ke/items/images/bewell_banner06.png',
      'linkType': 'PNG_IMAGE',
      'title': 'Wellness review',
      'description': 'You should have a wellness review daily',
      'thumbnail':
          'https://assets.healthcloud.co.ke/items/images/thumbs/bewell_banner06.png'
    },
    <String, dynamic>{
      'id': '1ns2o9GsFxyltGcAQg6mufS1lAD',
      'url':
          'https://assets.healthcloud.co.ke/items/documents/bewell_banner_27.pdf',
      'linkType': 'PDF_DOCUMENT',
      'title': 'Need to refill your meds?',
      'description': 'We will deliver',
      'thumbnail':
          'https://assets.healthcloud.co.ke/items/documents/thumbs/bewell_banner_27.png'
    },
  ],
  'actions': <dynamic>[
    <String, dynamic>{
      'id': '1ns2o6OE33iubBhPjhyQnks4znv',
      'sequenceNumber': 1,
      'name': 'RESOLVE_ITEM',
      'actionType': 'PRIMARY',
      'handling': 'INLINE',
      'allowAnonymous': false,
      'icon': <String, dynamic>{
        'id': '1ns2oDTr800KQMoAwlyS18DiHnp',
        'url':
            'https://assets.healthcloud.co.ke/items/images/thumbs/bewell_banner01.png',
        'linkType': 'PNG_IMAGE'
      },
    },
    <String, dynamic>{
      'id': '1ns2oCwJl5zt3SatNL9N4Jw8TDj',
      'sequenceNumber': 1,
      'name': 'PIN_ITEM',
      'actionType': 'PRIMARY',
      'handling': 'INLINE',
      'allowAnonymous': true,
      'icon': <String, dynamic>{
        'id': '1ns2oDTr800KQMoAwlyS18DiHnp',
        'url':
            'https://assets.healthcloud.co.ke/items/images/thumbs/bewell_banner01.png',
        'linkType': 'PNG_IMAGE'
      },
    },
  ],
  'conversations': <dynamic>[
    <String, dynamic>{
      'id': '1ns2oKfXTX1gMoO4VbJN5X0G6uY',
      'sequenceNumber': 1,
      'text':
          'I\'m the tests service. I\'ll help you deliver quality and affordable diagnostic tests. 👋!',
      'replyTo': '',
      'postedByUID': 'hOcaUv8dqqgmWYf9HEhjdudgf0b2',
      'postedByName': 'Tests Service',
      'timestamp': '2021-04-11T14:08:10Z'
    },
    <String, dynamic>{
      'id': '1ns2oKcNl9xSKzrJOl1CMhLhp27',
      'sequenceNumber': 1,
      'text':
          'I\'m the coaching service. I\'ll help you deliver your *awesome* coaching services to clients. 👋!',
      'replyTo': '',
      'postedByUID': 'hOcaUv8dqqgmWYf9HEhjdudgf0b2',
      'postedByName': 'Coaching Service',
      'timestamp': '2021-04-11T14:08:10Z'
    },
  ]
};

final Feed mockFeed = Feed.fromJson(
  <String, dynamic>{
    'items': <Item>[mockFeedItem],
    'nudges': mockFeedNudges,
    'action': <Action>[mockFeedAction]
  },
);

final List<Action> globalActionsData = <Action>[
  Action.fromJson(
    <String, dynamic>{
      'id': '1608647089',
      'sequenceNumber': 1608647089,
      'name': 'COMPLETE_INDIVIDUAL_RIDER_KYC',
      'actionType': 'PRIMARY',
      'handling': 'FULL_PAGE',
      'allowAnonymous': false,
      'icon': <String, dynamic>{
        'id': '1ns2oDTr800KQMoAwlyS18DiHnp',
        'url':
            'https://assets.healthcloud.co.ke/items/images/thumbs/bewell_banner01.png',
        'linkType': 'PNG_IMAGE'
      },
    },
  ),
  Action.fromJson(
    <String, dynamic>{
      'id': '34564564',
      'sequenceNumber': 34564564,
      'name': 'GET_TEST',
      'actionType': 'PRIMARY',
      'handling': 'FULL_PAGE',
      'allowAnonymous': false,
      'icon': <String, dynamic>{
        'id': '1ns2oDTr800KQMoAwlyS18DiHnp',
        'url':
            'https://assets.healthcloud.co.ke/items/images/thumbs/bewell_banner01.png',
        'linkType': 'PNG_IMAGE'
      },
    },
  ),
];

final Map<String, dynamic> mockFeedResponsePayload = <String, dynamic>{
  'data': <String, dynamic>{
    'getFeed': <String, dynamic>{
      'uid': '90B3cB9zPSciHC37RqBivbGrRa33',
      'flavour': 'PRO',
      'isAnonymous': false,
      'actions': <Map<String, dynamic>>[
        <String, dynamic>{
          'id': '1r1ie0pA5rRfa1EgHhMIhgcZ4Np',
          'sequenceNumber': 1,
          'name': 'SEARCH_PATIENT',
          'actionType': 'SECONDARY',
          'handling': 'FULL_PAGE',
          'allowAnonymous': false
        },
        <String, dynamic>{
          'id': '1r1ie0CPOpQtCiV6j51ScAhEI7M',
          'sequenceNumber': 1,
          'name': 'GET_HELP',
          'actionType': 'FLOATING',
          'handling': 'FULL_PAGE',
          'allowAnonymous': true
        },
        <String, dynamic>{
          'id': '1r1idoAs54kbZ90l9KkHSK7GKva',
          'sequenceNumber': 1,
          'name': 'ADD_PATIENT',
          'actionType': 'PRIMARY',
          'handling': 'FULL_PAGE',
          'allowAnonymous': false
        }
      ],
      'nudges': <Map<String, dynamic>>[
        <String, dynamic>{
          'id': '1r1idxG7lt6qo2PzvSPxLzSUvPU',
          'sequenceNumber': 1,
          'visibility': 'SHOW',
          'status': 'PENDING',
          'title': 'Add Primary Email Address',
          'text': 'Please add and verify your primary email address',
          'actions': <Map<String, dynamic>>[
            <String, dynamic>{
              'id': '1r1idyJk0holUbIlMYdbfItXBJC',
              'sequenceNumber': 1,
              'name': 'VERIFY_EMAIL',
              'actionType': 'PRIMARY',
              'handling': 'FULL_PAGE',
              'allowAnonymous': false
            }
          ],
          'groups': null,
          'users': <String>['90B3cB9zPSciHC37RqBivbGrRa33'],
          'links': <Map<String, dynamic>>[
            <String, dynamic>{
              'id': '1r1idv87d5QuqBUNpM5GrQCDefM',
              'url': 'https://assets.healthcloud.co.ke/nudges/verify_email.png',
              'linkType': 'PNG_IMAGE'
            }
          ],
          'notificationChannels': null
        },
        <String, dynamic>{
          'id': '1r1idzvmCvBmV7QFqbMUeOAVdgu',
          'sequenceNumber': 1,
          'visibility': 'SHOW',
          'status': 'PENDING',
          'title': 'Setup your partner account',
          'text': 'Create a partner account to begin transacting on Be.Well',
          'actions': <Map<String, dynamic>>[
            <String, dynamic>{
              'id': '1r1iduqsMSfhUFRM4DOdr0FN3Ap',
              'sequenceNumber': 1,
              'name': 'PARTNER_ACCOUNT_SETUP',
              'actionType': 'PRIMARY',
              'handling': 'FULL_PAGE',
              'allowAnonymous': false
            }
          ],
          'groups': null,
          'users': <String>['90B3cB9zPSciHC37RqBivbGrRa33'],
          'links': <Map<String, dynamic>>[
            <String, dynamic>{
              'id': '1r1idufMf2KqtQiv4gQyb6SsbOl',
              'url':
                  'https://assets.healthcloud.co.ke/nudges/complete_profile.png',
              'linkType': 'PNG_IMAGE'
            }
          ],
          'notificationChannels': null
        }
      ],
      'items': <Map<String, dynamic>>[
        <String, dynamic>{
          'id': '1r1ieGApt5fxwsYZeMgM8RyT8QQ',
          'sequenceNumber': 1,
          'expiry': '2121-06-26T14:08:10Z',
          'persistent': true,
          'status': 'PENDING',
          'visibility': 'SHOW',
          'label': 'WELCOME',
          'icon': <String, dynamic>{
            'id': '1r1ieNyW3l2I9pYcggpAufpEkK4',
            'url': 'https://assets.healthcloud.co.ke/bewell_logo.png',
            'linkType': 'PNG_IMAGE'
          },
          'author': 'Be.Well Team',
          'tagline': 'Welcome to Be.Well',
          'timestamp': '2021-04-11T14:08:10Z',
          'summary': 'What is Be.Well?',
          'text':
              'Be.Well is a virtual and physical healthcare community. Our goal is to make it easy for you to provide affordable high-quality healthcare - whether online or in person.',
          'links': <Map<String, dynamic>>[
            <String, dynamic>{
              'id': '1r1ie3uTRdNx8GemzcDWGoMUQHe',
              'url': 'https://youtu.be/gcv2Z2AdpjM',
              'linkType': 'YOUTUBE_VIDEO',
              'thumbnail':
                  'https://assets.healthcloud.co.ke/items/videos/thumbs/01_lead.png',
              'title': 'Be.Well lead'
            },
            <String, dynamic>{
              'id': '1r1ie5GOAba1LI66UNAtlIRg0Ll',
              'url': 'https://youtu.be/W_daZjDET9Q',
              'linkType': 'YOUTUBE_VIDEO',
              'thumbnail':
                  'https://assets.healthcloud.co.ke/items/videos/thumbs/02_prescription.png',
              'title': 'Prescription delivery'
            },
            <String, dynamic>{
              'id': '1r1ie4ACYEj2jBFQHWNzQqjsp9l',
              'url': 'https://youtu.be/IbtVBXNvpSA',
              'linkType': 'YOUTUBE_VIDEO',
              'thumbnail':
                  'https://assets.healthcloud.co.ke/items/videos/thumbs/03_teleconsult.png',
              'title': 'Teleconsults'
            },
            <String, dynamic>{
              'id': '1r1ie9WwxvLcBbsP4KqLASo1V41',
              'url': 'https://youtu.be/mKnlXcS3_Z0',
              'linkType': 'YOUTUBE_VIDEO',
              'thumbnail':
                  'https://assets.healthcloud.co.ke/items/videos/thumbs/04_slade.png',
              'title': 'Slade 360'
            },
            <String, dynamic>{
              'id': '1r1ie2y1GTulUoJAV1B7i2BxcsE',
              'url': 'https://youtu.be/XNDLnPfagLQ',
              'linkType': 'YOUTUBE_VIDEO',
              'thumbnail':
                  'https://assets.healthcloud.co.ke/items/videos/thumbs/05_mental_health.png',
              'title': 'Mental health'
            }
          ],
          'actions': <Map<String, dynamic>>[
            <String, dynamic>{
              'id': '1r1ie9po9hMeWCjPuDjRFtp2OCD',
              'sequenceNumber': 1,
              'name': 'RESOLVE_ITEM',
              'actionType': 'PRIMARY',
              'handling': 'INLINE',
              'allowAnonymous': false
            },
            <String, dynamic>{
              'id': '1r1ieCW4l0jtTAcjzVJqsH5tlkD',
              'sequenceNumber': 1,
              'name': 'PIN_ITEM',
              'actionType': 'PRIMARY',
              'handling': 'INLINE',
              'allowAnonymous': true
            },
            <String, dynamic>{
              'id': '1r1ieHn2K3AdqmTOhxH2ThQO5SM',
              'sequenceNumber': 1,
              'name': 'HIDE_ITEM',
              'actionType': 'PRIMARY',
              'handling': 'INLINE',
              'allowAnonymous': true
            }
          ],
          'conversations': <Map<String, dynamic>>[
            <String, dynamic>{
              'id': '1r1ieH0wXWtNdQL4GVvIyXfgYvS',
              'sequenceNumber': 1,
              'text':
                  'Im the booking assistant. I will help you book appointments and remind you when its time. 👋!',
              'replyTo': '1r1ieDc28MGEd5yPN9kNL4bqjB1',
              'postedByUID': 'hOcaUv8dqqgmWYf9HEhjdudgf0b2',
              'postedByName': 'Booking Assistant',
              'timestamp': '2021-04-11T14:08:09Z'
            },
            <String, dynamic>{
              'id': '1r1ieFMtB7bdBrDGm1ErUDOgBzM',
              'sequenceNumber': 1,
              'text':
                  'Im the delivery assistant. I help the medications service deliver medicines on time. 👋!',
              'replyTo': '1r1ieAt5n52lsPUBgLpcgomlLkI',
              'postedByUID': 'hOcaUv8dqqgmWYf9HEhjdudgf0b2',
              'postedByName': 'Delivery Assistant',
              'timestamp': '2021-04-11T14:08:09Z'
            },
            <String, dynamic>{
              'id': '1r1ieFDFWQbz8VmCy6TS2fNTbN8',
              'sequenceNumber': 1,
              'text':
                  'Im the reminders service. I will help you remember things that you need to do. 👋!',
              'replyTo': '1r1ieChia72QudVhwNY61nwIi1r',
              'postedByUID': 'hOcaUv8dqqgmWYf9HEhjdudgf0b2',
              'postedByName': 'Reminders Service',
              'timestamp': '2021-04-11T14:08:09Z'
            },
            <String, dynamic>{
              'id': '1r1ieEzrQ9Rmtgw460ZvrzYYqPE',
              'sequenceNumber': 1,
              'text':
                  'Im the dispensing assistant. I help you prepare your orders. 👋!',
              'replyTo': '1r1ieAt5n52lsPUBgLpcgomlLkI',
              'postedByUID': 'hOcaUv8dqqgmWYf9HEhjdudgf0b2',
              'postedByName': 'Dispensing Assistant',
              'timestamp': '2021-04-11T14:08:09Z'
            },
            <String, dynamic>{
              'id': '1r1ieDc28MGEd5yPN9kNL4bqjB1',
              'sequenceNumber': 1,
              'text':
                  'Im the consultations service. I will set up in-person and remote consultations for you. 👋!',
              'replyTo': '1r1ieChia72QudVhwNY61nwIi1r',
              'postedByUID': 'hOcaUv8dqqgmWYf9HEhjdudgf0b2',
              'postedByName': 'Consultations Service',
              'timestamp': '2021-04-11T14:08:09Z'
            },
            <String, dynamic>{
              'id': '1r1ieCrRiKe48EseOUjVHUEJ8Vf',
              'sequenceNumber': 1,
              'text':
                  'Im the teleconsultations assistant. I will ensure that you can conduct consultations via video or audio conference, whenever you need to. If you have an emergency, I will help you find the nearest hospital for emergencies. 👋!',
              'replyTo': '1r1ieDc28MGEd5yPN9kNL4bqjB1',
              'postedByUID': 'hOcaUv8dqqgmWYf9HEhjdudgf0b2',
              'postedByName': 'Teleconsultations Assistant',
              'timestamp': '2021-04-11T14:08:09Z'
            },
            <String, dynamic>{
              'id': '1r1ieCrOR7RVlE0cqCd1sCsmhFs',
              'sequenceNumber': 1,
              'text':
                  'Im the tests service. I will help you deliver quality and affordable diagnostic tests. 👋!',
              'replyTo': '1r1ieChia72QudVhwNY61nwIi1r',
              'postedByUID': 'hOcaUv8dqqgmWYf9HEhjdudgf0b2',
              'postedByName': 'Tests Service',
              'timestamp': '2021-04-11T14:08:09Z'
            },
            <String, dynamic>{
              'id': '1r1ieChia72QudVhwNY61nwIi1r',
              'sequenceNumber': 1,
              'text': 'Welcome to Be.Well. We are glad to meet you!',
              'replyTo': '',
              'postedByUID': 'hOcaUv8dqqgmWYf9HEhjdudgf0b2',
              'postedByName': 'Be.Well',
              'timestamp': '2021-04-11T14:08:09Z'
            },
            <String, dynamic>{
              'id': '1r1ieBwF99qfM53OjV8S0925B3d',
              'sequenceNumber': 1,
              'text':
                  'Im the coaching service. I will help you deliver your *awesome* coaching services to clients. 👋!',
              'replyTo': '1r1ieChia72QudVhwNY61nwIi1r',
              'postedByUID': 'hOcaUv8dqqgmWYf9HEhjdudgf0b2',
              'postedByName': 'Coaching Service',
              'timestamp': '2021-04-11T14:08:09Z'
            },
            <String, dynamic>{
              'id': '1r1ieAt5n52lsPUBgLpcgomlLkI',
              'sequenceNumber': 1,
              'text':
                  'Im the medications service. I will help you deliver quality and affordable medications, on time. 👋!',
              'replyTo': '1r1ieChia72QudVhwNY61nwIi1r',
              'postedByUID': 'hOcaUv8dqqgmWYf9HEhjdudgf0b2',
              'postedByName': 'Medications Service',
              'timestamp': '2021-04-11T14:08:09Z'
            }
          ]
        }
      ]
    }
  }
};
