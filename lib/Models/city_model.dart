import 'package:events_app_user/Models/participant_model.dart';

class ModelCity {
  String? id;
  String? cityName;
  String? capital;

  List<ParticipantModel>? tblParticipants;

  ModelCity({this.id, this.cityName, this.capital, this.tblParticipants});

  ModelCity.fromJson(Map<String, dynamic> json) {
    cityName = json['cityName'];
    capital = json['capital'];
    id = json['id'];
    if (json['tblUsers'] != null) {
      tblParticipants = <ParticipantModel>[];
      json['tblUsers'].forEach((v) {
        tblParticipants!.add(new ParticipantModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cityName'] = this.cityName;
    data['capital'] = this.capital;
    if (this.tblParticipants != null) {
      data['tblUsers'] = this.tblParticipants!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
