import 'package:events_app_user/Models/favorite_model.dart';
import 'package:events_app_user/Models/notification_model.dart';

import 'country_model.dart';

class ParticipantModel {
  final String? id;
  final String? fullname;
  final String? nickname;
  final String? email;
  final String? password;
  final String? phone;
  final String? avatarUrl;
  final String? cityName;
  final int? age;
  final CountryModel? country;
  final List<String>? musicPreferences;
  final List<String>? eventHistory;
  final FavoritesModel? favorites;
  final NotificationsModel? notifications;

  ParticipantModel({
    this.id,
    this.fullname,
    this.nickname,
    this.email,
    this.password,
    this.phone,
    this.avatarUrl,
    this.cityName,
    this.age,
    this.country,
    this.musicPreferences = const [],
    this.eventHistory = const [],
    this.favorites,
    this.notifications,
  });
  factory ParticipantModel.fromJson(Map<String, dynamic> json) {
    return ParticipantModel(
      id: json['_id'],
      fullname: json['fullname'],
      nickname: json['nickname'],
      email: json['email'],
      password: json['password'],
      avatarUrl: json['avatarUrl'],
      age: json['age'],
      phone: json['phone'],
      cityName: json['cityName'],
      country: json['country'],
      musicPreferences: json['musicPreferences'],
      eventHistory: json['eventHistory'],
      favorites: json['favorites'],
      notifications: json['notifications'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'fullname': fullname,
      'nickname': nickname,
      'email': email,
      'password': password,
      'avatarUrl': avatarUrl,
      'age': age,
      'phone': phone,
      'cityName': cityName,
      'country': country,
      'musicPreferences': musicPreferences,
      'eventHistory': eventHistory,
      'favorites': favorites,
      'notifications': notifications,
    };
  }
}
