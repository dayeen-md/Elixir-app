// To parse this JSON data, do
//
//     final responseModel = responseModelFromJson(jsonString);

import 'dart:convert';

ResponseModel responseModelFromJson(String str) =>
    ResponseModel.fromJson(json.decode(str));

String responseModelToJson(ResponseModel data) => json.encode(data.toJson());

class ResponseModel {
  ResponseModel({
    required this.username,
    required this.email,
    required this.appointment,
  });

  String username;
  String email;
  List<Appointment> appointment;

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
        username: json["username"],
        email: json["email"],
        appointment: List<Appointment>.from(
            json["appointment"].map((x) => Appointment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "appointment": List<dynamic>.from(appointment.map((x) => x.toJson())),
      };
}

class Appointment {
  Appointment({
    required this.id,
    required this.disease,
    required this.disorder,
    required this.patientId,
    required this.syndrome,
    required this.info,
  });

  int id;
  String disease;
  String disorder;
  int patientId;
  String syndrome;
  String info;

  factory Appointment.fromJson(Map<String, dynamic> json) => Appointment(
        id: json["id"],
        disease: json["disease"],
        disorder: json["disorder"],
        patientId: json["patient_id"],
        syndrome: json["syndrome"],
        info: json["info"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "disease": disease,
        "disorder": disorder,
        "patient_id": patientId,
        "syndrome": syndrome,
        "info": info,
      };
}
