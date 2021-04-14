import 'package:flutter_test/flutter_test.dart';
import 'package:sil_feed/src/domain/value_objects/constants.dart';

void main() {
  group('Constants', () {
    test('should return allConsumerActions', () {
      expect(allConsumerActions, <String>[
        kGetMedicine,
        kGetConsultation,
        kGetCoaching,
        kGetTest,
        kAddNHIF,
        kAddInsurance,
        kGetInsurance,

        // shared
        kVerifyEmail,
        kCompleteProfile,
        kResolveItem,
        kPinItem,
        kHideItem,
        kMarkSelectedItem,
      ]);
    });
    test('should return allProActions', () {
      expect(allProActions, <String>[
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
      ]);
    });
  });
}
