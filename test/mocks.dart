import 'dart:io' as io;

import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';
import 'package:sil_feed/src/domain/value_objects/constants.dart';
import 'package:sil_feed/src/domain/value_objects/widget_keys.dart';
import 'package:sil_feed/src/presentation/widgets/nudge_carousel.dart';

import 'package:sil_ui_components/sil_small_appbar.dart';

class MockRoutes {
  static const String route1 = '/route1';
  static const String nudgeCarousel = '/route2';
}

// these mocks are used to test the back button of SIL small appbar
class MockRouteGenerator {
  /// gets the current route based on the [RouteSettings]
  static Route<dynamic> generateRoute(RouteSettings settings) {
    Map<String, Function> getFeedActionCallbacks() {
      return <String, Function>{
        kCompleteIndividualRiderKYC: () {},
      };
    }

    switch (settings.name) {

      // the root route config

      case MockRoutes.route1:
        return MaterialPageRoute<MaterialApp>(
          builder: (_) => const MaterialApp(
            home: Scaffold(
              appBar: SILSmallAppBar(title: MockRoutes.route1),
            ),
          ),
        );

      case MockRoutes.nudgeCarousel:
        return MaterialPageRoute<Widget>(
            builder: (_) => NudgeCarousel(
                  key: nudgeCarouselKey,
                  flavour: consumerFlavor,
                  isAnonymous: false,
                  isSmallScreen: false,
                  isAnonymousFunc: () {},
                  nudgeCarouselCallbacks: getFeedActionCallbacks(),
                  nudges: mockFeedNudges,
                  single: false,
                  unroll: false,
                ));
    }

    return MaterialPageRoute<MaterialApp>(
      builder: (_) => const MaterialApp(
        home: Scaffold(
          appBar: SILSmallAppBar(title: 'Default route'),
        ),
      ),
    );
  }
}

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

final List<Map<String, dynamic>> mockFeedItemActions = <Map<String, dynamic>>[
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
  }
];
final List<Map<String, dynamic>> mockFeedItemActionsAllowAnonymous =
    <Map<String, dynamic>>[
  <String, dynamic>{
    'id': '1oBxEPUVwchV3RPYK37QmywsNq4',
    'sequenceNumber': 1,
    'name': 'RESOLVE_ITEM',
    'actionType': 'PRIMARY',
    'handling': 'INLINE',
    'allowAnonymous': true
  },
  <String, dynamic>{
    'id': '1oBxEPUVwchV3RPYK37QmywsNq4',
    'sequenceNumber': 1,
    'name': 'HIDE_ITEM',
    'actionType': 'PRIMARY',
    'handling': 'INLINE',
    'allowAnonymous': true
  },
  <String, dynamic>{
    'id': '1oBxEPUVwchV3RPYK37QmywsNq4',
    'sequenceNumber': 1,
    'name': 'PIN_ITEM',
    'actionType': 'PRIMARY',
    'handling': 'INLINE',
    'allowAnonymous': true
  }
];
final List<Map<String, dynamic>> mockFeedItemHideActions =
    <Map<String, dynamic>>[
  <String, dynamic>{
    'id': '1oBxEPUVwchV3RPYK37QmywsNq4',
    'sequenceNumber': 1,
    'name': 'HIDE_ITEM',
    'actionType': 'PRIMARY',
    'handling': 'INLINE',
    'allowAnonymous': false
  },
];
final List<Map<String, String>> mockFeedLinks = <Map<String, String>>[
  <String, String>{
    'id': '1lmN7huRFi1PTCNIejxPQXy7KkC',
    'url': 'https://www.youtube.com/watch?v=gcv2Z2AdpjM',
    'linkType': 'YOUTUBE_VIDEO',
    'title': 'Be.Well lead',
    'description': 'Introducing Be.Well by Slade 360',
    'thumbnail':
        'https://assets.healthcloud.co.ke/items/videos/thumbs/01_lead.png'
  },
  <String, String>{
    'id': '1lmN7WFfyzVZ27bar4mh5ffAP2K',
    'url': 'https://assets.healthcloud.co.ke/nudges/verify_email.png',
    'linkType': 'PNG_IMAGE'
  },
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
];

final Map<String, dynamic> mockFeedPrimaryAction = <String, dynamic>{
  'id': '1lmN7ZKSVsJqfZ0gSJzFGExstWX',
  'name': 'VERIFY_EMAIL',
  'actionType': 'PRIMARY',
  'handling': 'FULL_PAGE',
  'allowAnonymous': true
};

final Map<String, dynamic> mockFeedSecondaryAction = <String, dynamic>{
  'id': '1lmN7ZKSVsJqfZ0gSJzFGExstWX',
  'name': 'VERIFY_EMAIL',
  'actionType': 'SECONDARY',
  'handling': 'FULL_PAGE',
  'allowAnonymous': true,
  'nudgeCallbacks': <String, dynamic>{' kCompleteIndividualRiderKYC': '445212'}
};

final Map<String, dynamic> mockFeedOverflowAction = <String, dynamic>{
  'id': '1lmN7ZKSVsJqfZ0gSJzFGExstWX',
  'name': 'VERIFY_EMAIL',
  'actionType': 'OVERFLOW',
  'handling': 'FULL_PAGE',
  'allowAnonymous': true
};

Map<String, dynamic> mockFeedAction = <String, dynamic>{
  'id': '1ns2o0A6DumWaWAInYOruVnr1QE',
  'sequenceNumber': 1,
  'name': 'SEARCH_PATIENT',
  'actionType': 'SECONDARY',
  'handling': 'FULL_PAGE',
  'allowAnonymous': false
};
Map<String, dynamic> nudge = <String, dynamic>{
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
};
List<dynamic> mockFeedNudges = <dynamic>[
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
  },
  <String, dynamic>{
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
  },
];

const String author = 'Be.Well Team';
const String iconUrl = 'https://assets.healthcloud.co.ke/bewell_logo.png';
const String itemID = '1ns2oDTr800KQMoAwlyS18DiHnp';
const String tagline = 'Welcome to Be.Well';
const String timestamp = '2021-02-01T07:30:50Z';

Map<String, dynamic> mockFeedItem = <String, dynamic>{
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
  'links': <dynamic>[
    // <String, dynamic>{
    //   'id': '1ns2o8pktkMsAEmP9dIKFvIhvAC',
    //   'url': 'https://youtu.be/gcv2Z2AdpjM',
    //   'linkType': 'YOUTUBE_VIDEO',
    //   'thumbnail':
    //       'https://assets.healthcloud.co.ke/items/videos/thumbs/01_lead.png',
    //   'title': 'Be.Well lead'
    // },
    // <String, dynamic>{
    //   'id': '1ns2o9kdNr1wyAyuybtsr9VQSs8',
    //   'url': 'https://youtu.be/W_daZjDET9Q',
    //   'linkType': 'YOUTUBE_VIDEO',
    //   'thumbnail':
    //       'https://assets.healthcloud.co.ke/items/videos/thumbs/02_prescription.png',
    //   'title': 'Prescription delivery'
    // },
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
    },
    <String, dynamic>{
      'id': '1ns2oKcNl9xSKzrJOl1CMhLhp27',
      'sequenceNumber': 1,
      'text':
          'I\'m the coaching service. I\'ll help you deliver your *awesome* coaching services to clients. 👋!',
      'replyTo': '',
      'postedByUID': 'hOcaUv8dqqgmWYf9HEhjdudgf0b2',
      'postedByName': 'Coaching Service'
    },
  ]
};

// Map<String, dynamic> mockFeedItemConversations = <String, dynamic>{
//   'conversations': <dynamic>[
//     <String, dynamic>{
//       'id': '1ns2oKfXTX1gMoO4VbJN5X0G6uY',
//       'sequenceNumber': 1,
//       'text':
//           'I\'m the tests service. I\'ll help you deliver quality and affordable diagnostic tests. 👋!',
//       'replyTo': '',
//       'postedByUID': 'hOcaUv8dqqgmWYf9HEhjdudgf0b2',
//       'postedByName': 'Tests Service'
//     },
//     <String, dynamic>{
//       'id': '1ns2oKcNl9xSKzrJOl1CMhLhp27',
//       'sequenceNumber': 1,
//       'text':
//           'I\'m the coaching service. I\'ll help you deliver your *awesome* coaching services to clients. 👋!',
//       'replyTo': '',
//       'postedByUID': 'hOcaUv8dqqgmWYf9HEhjdudgf0b2',
//       'postedByName': 'Coaching Service'
//     },
//   ]
// };

Map<String, dynamic> mockFeed = <String, dynamic>{
  'items': <dynamic>[mockFeedItem, mockFeedItem],
  'nudges': <dynamic>[mockFeedNudges, mockFeedNudges],
  'action': <dynamic>[mockFeedAction, mockFeedAction]
};

final List<Map<String, dynamic>> globalActionsData = <Map<String, dynamic>>[
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
  }
];

// Returns a mock HTTP client that responds with an image to all requests.

class MockHttpClientIO extends Mock implements io.HttpClient {}

class MockHttpClientRequest extends Mock implements io.HttpClientRequest {}

class MockHttpClientResponse extends Mock implements io.HttpClientResponse {}

class MockHttpHeaders extends Mock implements io.HttpHeaders {}
