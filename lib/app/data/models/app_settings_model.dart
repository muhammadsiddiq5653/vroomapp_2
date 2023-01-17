class AppSettingsModel {
  String? logo;
  bool maintenance = false;
  String? termsAndCondition;
  bool forceUpdate = false;
  AppSettingsModel({required this.forceUpdate, this.logo});

  AppSettingsModel.fromJson(Map<String, dynamic> json) {
    logo = json['logo'];
    forceUpdate = (json['force_update'] == true);
    maintenance = json['maintenance'] == true;
    termsAndCondition = json['terms_and_conditions'];
  }
}
