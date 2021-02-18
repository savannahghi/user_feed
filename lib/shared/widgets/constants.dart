const String consumerFlavor = 'CONSUMER';
const String professionalString = 'PRO';
const String documentString = 'Documents';
const String imageString = 'Images';
const String primaryActionType = 'PRIMARY';
const String secondaryActionType = 'SECONDARY';

const int kShortSnackbarDuration = 5;
const int kLongSnackbarDuration = 10;

const String fallbackPdfUrl =
    'https://drive.google.com/file/d/1iatNetodzAvpnBn-dr3amR1db1hy_LuG/view?usp=sharing';
const String fallbackUrl =
    'https://assets.healthcloud.co.ke/items/images/thumbs/bewell_banner01.png';

const String resolveIconUrl = 'assets/images/resolve.svg';
const String hideIconUrl = 'assets/images/hide.svg';
const String pinIconUrl = 'assets/images/pin.svg';

/// CONSUMER
///
/// feed global actions
const String kGetMedicine = 'GET_MEDICINE';
const String kGetConsultation = 'GET_CONSULTATION';
const String kGetCoaching = 'GET_COACHING';
const String kGetTest = 'GET_TEST';

/// nugde actions
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
const String kCompleteOrganisationRiderKYC = 'COMPLETE_ORGANISATION_RIDER_KYC';
const String kCompleteIndividualPractitionerKYC =
    'COMPLETE_INDIVIDUAL_PRACTITIONER_KYC';
const String kCompleteOrganisationPractitionerKYC =
    'COMPLETE_ORGANISATION_PRACTITIONER_KYC';
const String kCompleteIndividualProviderKYC =
    'COMPLETE_INDIVIDUAL_PROVIDER_KYC';
const String kCompleteOrganisationProviderKYC =
    'COMPLETE_ORGANISATION_PROVIDER_KYC';
const String kCompleteIndividualPharmacueticalKYC =
    'COMPLETE_INDIVIDUAL_PHARMACEUTICAL_KYC';
const String kCompleteOrganisationPharmacueticalKYC =
    'COMPLETE_ORGANISATION_PHARMACEUTICAL_KYC';
const String kCompleteIndividualCoachKYC = 'COMPLETE_INDIVIDUAL_COACH_KYC';
const String kCompleteOrganisationCoachKYC = 'COMPLETE_ORGANISATION_COACH_KYC';
const String kCompleteIndividualNutritionKYC =
    'COMPLETE_INDIVIDUAL_NUTRITION_KYC';
const String kCompleteOrganisationNutritionKYC =
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

/// a list of all consumert actions
List<String> allConsumerActions = <String>[
  kGetMedicine,
  kGetConsultation,
  kGetCoaching,
  kGetTest,
  kAddNHIF,
  kAddInsurance,

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
  kCompleteOrganisationRiderKYC,
  kCompleteIndividualPractitionerKYC,
  kCompleteOrganisationPractitionerKYC,
  kCompleteIndividualProviderKYC,
  kCompleteOrganisationProviderKYC,
  kCompleteIndividualPharmacueticalKYC,
  kCompleteOrganisationPharmacueticalKYC,
  kCompleteIndividualCoachKYC,
  kCompleteOrganisationCoachKYC,
  kCompleteIndividualNutritionKYC,
  kCompleteOrganisationNutritionKYC,
  kPartnerAccountSetup,

  // shared
  kVerifyEmail,
  kCompleteProfile,
  kResolveItem,
  kPinItem,
  kHideItem,
  kMarkSelectedItem,
];
