class AppSettingsModel {
  String? logo;
  bool maintenance = false;
  String? termsAndCondition;
  String? about;
  String? faq;
  String? appLink;
  bool forceUpdate = false;
  AppSettingsModel({required this.forceUpdate, this.logo});

  AppSettingsModel.fromJson(Map<String, dynamic> json) {
    logo = json['logo'];
    forceUpdate = (json['force_update'] == true);
    maintenance = json['maintenance'] == true;
    termsAndCondition = json['terms_and_conditions'];
    appLink = json['app_link'];
    faq = json['faq'];
    about = json['about'];
  }
}
