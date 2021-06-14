// const String consumerFlavor = 'CONSUMER';
// const String professionalFlavor = 'PRO';

const String documentString = 'Documents';
const String imageString = 'Images';
const String coverAction = 'assets/cover_action.svg';
const String primaryActionType = 'PRIMARY';
const String secondaryActionType = 'SECONDARY';

const int kShortSnackbarDuration = 5;
const int kLongSnackbarDuration = 10;

const String fallbackPdfUrl =
    'https://drive.google.com/file/d/1iatNetodzAvpnBn-dr3amR1db1hy_LuG/view?usp=sharing';
const String fallbackUrl =
    'https://assets.healthcloud.co.ke/items/images/thumbs/bewell_banner01.png';

/// CONSUMER
///
/// feed global actions
const String kGetMedicine = 'GET_MEDICINE';
const String kGetConsultation = 'GET_CONSULTATION';
const String kGetCoaching = 'GET_COACHING';
const String kGetTest = 'GET_TEST';
const String kBuyInsurance = 'GET_INSURANCE';
const String kViewCover = 'VIEW_COVER';

/// nudge actions
const String kAddNHIF = 'ADD_NHIF';
const String kAddInsurance = 'ADD_INSURANCE';

/// PROFESSIONAL

/// feed global actions
const String kSearchPatient = 'SEARCH_PATIENT';
const String kGetHelp = 'GET_HELP';
const String kAddPatient = 'ADD_PATIENT';
const String kPartnerAccountSetup = 'PARTNER_ACCOUNT_SETUP';

/// nudge actions
const String kCompleteIndividualRiderKYC = 'COMPLETE_INDIVIDUAL_RIDER_KYC';
const String kCompleteOrganizationRiderKYC = 'COMPLETE_ORGANISATION_RIDER_KYC';
const String kCompleteIndividualPractitionerKYC =
    'COMPLETE_INDIVIDUAL_PRACTITIONER_KYC';
const String kCompleteOrganizationPractitionerKYC =
    'COMPLETE_ORGANISATION_PRACTITIONER_KYC';
const String kCompleteIndividualProviderKYC =
    'COMPLETE_INDIVIDUAL_PROVIDER_KYC';
const String kCompleteOrganizationProviderKYC =
    'COMPLETE_ORGANISATION_PROVIDER_KYC';
const String kCompleteIndividualPharmaceuticalKYC =
    'COMPLETE_INDIVIDUAL_PHARMACEUTICAL_KYC';
const String kCompleteOrganizationPharmaceuticalKYC =
    'COMPLETE_ORGANISATION_PHARMACEUTICAL_KYC';
const String kCompleteIndividualCoachKYC = 'COMPLETE_INDIVIDUAL_COACH_KYC';
const String kCompleteOrganizationCoachKYC = 'COMPLETE_ORGANISATION_COACH_KYC';
const String kCompleteIndividualNutritionKYC =
    'COMPLETE_INDIVIDUAL_NUTRITION_KYC';
const String kCompleteOrganizationNutritionKYC =
    'COMPLETE_ORGANISATION_NUTRITION_KYC';

/// SHARED actions across PRO and CONSUMER

/// item actions
const String kVerifyEmail = 'VERIFY_EMAIL';
const String kCompleteProfile = 'COMPLETE_PROFILE';
const String kResolveItem = 'RESOLVE_ITEM';
const String kPinItem = 'PIN_ITEM';
const String kHideItem = 'HIDE_ITEM';

/// used to mark the current feed items as active
/// - this will be useful when retiring, pinning and resolving items
///
const String kMarkSelectedItem = 'MARK_SELECTED_ITEM';

/// a list of all consumer actions
List<String> allConsumerActions = <String>[
  kGetMedicine,
  kGetConsultation,
  kGetCoaching,
  kGetTest,
  kAddNHIF,
  kAddInsurance,
  kBuyInsurance,
  kViewCover,

  // shared
  kVerifyEmail,
  kCompleteProfile,
  kResolveItem,
  kPinItem,
  kHideItem,
  kMarkSelectedItem,
];

/// a list of all professional actions
List<String> allProActions = <String>[
  kSearchPatient,
  kGetHelp,
  kAddPatient,

  kCompleteIndividualRiderKYC,
  kCompleteOrganizationRiderKYC,
  kCompleteIndividualPractitionerKYC,
  kCompleteOrganizationPractitionerKYC,
  kCompleteIndividualProviderKYC,
  kCompleteOrganizationProviderKYC,
  kCompleteIndividualPharmaceuticalKYC,
  kCompleteOrganizationPharmaceuticalKYC,
  kCompleteIndividualCoachKYC,
  kCompleteOrganizationCoachKYC,
  kCompleteIndividualNutritionKYC,
  kCompleteOrganizationNutritionKYC,
  kPartnerAccountSetup,

  // shared
  kVerifyEmail,
  kCompleteProfile,
  kResolveItem,
  kPinItem,
  kHideItem,
  kMarkSelectedItem,
];

const String defaultInitialFeedVideoUrl = 'mKnlXcS3_Z0';
//cover call to action
const String coverCallToActionTitle = 'We\'ve got you covered';
const String viewCoverCallToActionTitle = 'View my Cover';
const String coverCallToActionBody =
    'Protect yourself and your loved ones by buying or adding a cover for swift healthcare access';
const String viewCoverCallToActionBody =
    'Buy a cover or keep up to date with your cover details';
const String buyInsurance = 'Buy Cover';
const String addInsurance = 'Add Cover';
const String viewCover = 'View Cover';
