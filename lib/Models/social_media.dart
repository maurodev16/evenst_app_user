class SocialMediaModel {
  String facebook;
  String instagram;
  String twitter;

  SocialMediaModel({
    this.facebook = '',
    this.instagram = '',
    this.twitter = '',
  });

  factory SocialMediaModel.fromJson(Map<String, dynamic> json) {
    return SocialMediaModel(
      facebook: json['facebook'],
      instagram: json['instagram'],
      twitter: json['twitter'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'facebook': facebook,
      'instagram': instagram,
      'twitter': twitter,
    };
  }
}
