class AirLineModel {
  String site;

  String defaultName;

  String logoURLWithoutBaseUrl;

  String phone;

  String usName;

  String name;

  String code;

  String get imageUrl => "https://www.kayak.com/$logoURLWithoutBaseUrl";

  AirLineModel(
      {this.site,
      this.defaultName,
      this.logoURLWithoutBaseUrl,
      this.phone,
      this.usName,
      this.name,
      this.code});
}
