class CountryModel {
  String? code;
  String? name;
  String? emoji;
  String? emojiUnicode;
  String? capital;
  String? continent;
  String? currency;
  List<String> languages;

  CountryModel({
    this.code,
    this.name,
    this.emoji,
    this.emojiUnicode,
    this.capital,
    this.continent,
    this.currency,
    this.languages = const [],
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      code: json['code'] as String?,
      name: json['name'] as String?,
      emoji: json['emoji'] as String?,
      emojiUnicode: json['emojiUnicode'] as String?,
      capital: json['capital'] as String?,
      continent: json['continent'] as String?,
      currency: json['currency'] as String?,
      languages: List<String>.from(json['languages'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'name': name,
      'emoji': emoji,
      'emojiUnicode': emojiUnicode,
      'capital': capital,
      'continent': continent,
      'currency': currency,
      'languages': languages,
    };
  }
}
