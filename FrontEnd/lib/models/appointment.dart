// To parse this JSON data, do
//
//     final patientInfo = patientInfoFromJson(jsonString);

import 'dart:convert';

PatientInfo patientInfoFromJson(String str) =>
    PatientInfo.fromJson(json.decode(str));

String patientInfoToJson(PatientInfo data) => json.encode(data.toJson());

class PatientInfo {
  PatientInfo({
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

  factory PatientInfo.fromJson(Map<String, dynamic> json) => PatientInfo(
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
