import 'package:ugt_client/models/lecturer.dart';
import 'package:ugt_client/models/student.dart';

class Auth {
  String? userId;
  String? profileId;
  String? role;
  String? accessToken;
  String? validUntil;
  String? fullName;
  Lecturer? lecturer;
  Student? student;

  Auth({
    this.userId,
    this.profileId,
    this.role,
    this.accessToken,
    this.validUntil,
    this.fullName,
    this.lecturer,
    this.student,
  });

  factory Auth.fromMap(Map<String, dynamic> json) {
    return Auth(
      userId: json["userId"],
      profileId: json["profileId"],
      role: json["role"],
      accessToken: json["accessToken"],
      validUntil: json["validUntil"],
      fullName: json["fullName"],
      lecturer: json["lecturer"] == null ? null : Lecturer.fromMap(json["lecturer"]),
      student: json["student"] == null ? null : Student.fromMap(json["student"]),
    );
  }

  Map<String, dynamic> toMap() => {
        "userId": this.userId,
        "profileId": this.profileId,
        "role": this.role,
        "accessToken": this.accessToken,
        "validUntil": this.validUntil,
        "fullName": this.fullName,
        "lecturer": lecturer == null ? null : lecturer!.toMap(),
        "student": student == null ? null : student!.toMap(),
      };

  bool isAdmin() => this.role == "ADM";
  bool isLecturer() => this.role == "LEC" || this.role == "ADM";
  bool isStudent() => this.role == "STU";
}
