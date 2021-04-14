import 'package:sil_feed/src/domain/value_objects/constants.dart';

Map<String, Function> mockGetFeedActionCallbacks() => <String, Function>{
      kCompleteIndividualRiderKYC: () {},
      kCompleteOrganizationRiderKYC: () {},
      kCompleteIndividualPractitionerKYC: () {},
      kCompleteOrganizationPractitionerKYC: () {},
      kCompleteOrganizationProviderKYC: () {},
      kCompleteIndividualPharmaceuticalKYC: () {},
      kCompleteOrganizationPharmaceuticalKYC: () {},
      kCompleteIndividualCoachKYC: () {},
      kCompleteOrganizationCoachKYC: () {},
      kCompleteIndividualNutritionKYC: () {},
      kCompleteOrganizationNutritionKYC: () {},
      kCompleteProfile: () {},
      kVerifyEmail: () {},
      kPartnerAccountSetup: () {},
    };
