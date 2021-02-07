import 'dart:core';

class AirLineDomainModel {
  String site;

  String defaultName;

  String phone;

  String usName;

  String name;

  String code;

  String imageUrl;

  bool isFavourite = false;

  AirLineDomainModel(
      {this.site,
      this.defaultName,
      this.phone,
      this.usName,
      this.name,
      this.code,
      this.imageUrl,
      this.isFavourite});

  AirLineDomainModel.fromJson(Map<String, dynamic> json)
      : site = json['site'] as String,
        defaultName = json['defaultName'] as String,
        phone = json['phone'] as String,
        usName = json['usName'] as String,
        name = json['name'] as String,
        code = json['code'] as String,
        imageUrl = json['imageUrl'] as String,
        isFavourite = json['isFavourite'] as bool;

  Map<String, dynamic> toJson() => {
        'site': site,
        'defaultName': defaultName,
        'phone': phone,
        'usName': usName,
        'name': name,
        'code': code,
        'imageUrl': imageUrl,
        'isFavourite': isFavourite,
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AirLineDomainModel &&
          runtimeType == other.runtimeType &&
          site == other.site &&
          defaultName == other.defaultName &&
          phone == other.phone &&
          usName == other.usName &&
          name == other.name &&
          code == other.code;

  @override
  int get hashCode =>
      site.hashCode ^
      defaultName.hashCode ^
      phone.hashCode ^
      usName.hashCode ^
      name.hashCode ^
      code.hashCode;
}
