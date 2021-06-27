import 'dart:convert';

class Student {
  String? userId;
  String? firstName;
  String? lastName;
  String? fullName;
  String? email;
  String? phone;
  String? name;
  String? enumCode;
  String? id;
  String? studentNumber;
  String? entranceDate;
  String? unit;
  String? facultyName;
  String? programId;
  String? programName;
  int? yearOfBirth;
  String? pictureUrl;
  int? grade;
  String? createdOn;
  String? modifiedOn;
  int? statusId;
  Student({
    this.userId,
    this.firstName,
    this.lastName,
    this.fullName,
    this.email,
    this.phone,
    this.name,
    this.enumCode,
    this.id,
    this.studentNumber,
    this.entranceDate,
    this.unit,
    this.facultyName,
    this.programId,
    this.programName,
    this.yearOfBirth,
    this.pictureUrl,
    this.grade,
    this.createdOn,
    this.modifiedOn,
    this.statusId,
  });

  Student copyWith({
    String? userId,
    String? firstName,
    String? lastName,
    String? fullName,
    String? email,
    String? phone,
    String? name,
    String? enumCode,
    String? id,
    String? studentNumber,
    String? entranceDate,
    String? unit,
    String? facultyName,
    String? programId,
    String? programName,
    int? yearOfBirth,
    String? pictureUrl,
    int? grade,
    String? createdOn,
    String? modifiedOn,
    int? statusId,
  }) {
    return Student(
      userId: userId ?? this.userId,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      name: name ?? this.name,
      enumCode: enumCode ?? this.enumCode,
      id: id ?? this.id,
      studentNumber: studentNumber ?? this.studentNumber,
      entranceDate: entranceDate ?? this.entranceDate,
      unit: unit ?? this.unit,
      facultyName: facultyName ?? this.facultyName,
      programId: programId ?? this.programId,
      programName: programName ?? this.programName,
      yearOfBirth: yearOfBirth ?? this.yearOfBirth,
      pictureUrl: pictureUrl ?? this.pictureUrl,
      grade: grade ?? this.grade,
      createdOn: createdOn ?? this.createdOn,
      modifiedOn: modifiedOn ?? this.modifiedOn,
      statusId: statusId ?? this.statusId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'firstName': firstName,
      'lastName': lastName,
      'fullName': fullName,
      'email': email,
      'phone': phone,
      'name': name,
      'enumCode': enumCode,
      'id': id,
      'studentNumber': studentNumber,
      'entranceDate': entranceDate,
      'unit': unit,
      'facultyName': facultyName,
      'programId': programId,
      'programName': programName,
      'yearOfBirth': yearOfBirth,
      'pictureUrl': pictureUrl,
      'grade': grade,
      'createdOn': createdOn,
      'modifiedOn': modifiedOn,
      'statusId': statusId,
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      userId: map['userId'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      fullName: map['fullName'],
      email: map['email'],
      phone: map['phone'],
      name: map['name'],
      enumCode: map['enumCode'],
      id: map['id'],
      studentNumber: map['studentNumber'],
      entranceDate: map['entranceDate'],
      unit: map['unit'],
      facultyName: map['facultyName'],
      programId: map['programId'],
      programName: map['programName'],
      yearOfBirth: map['yearOfBirth'],
      pictureUrl: map['pictureUrl'],
      grade: map['grade'],
      createdOn: map['createdOn'],
      modifiedOn: map['modifiedOn'],
      statusId: map['statusId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Student.fromJson(String source) => Student.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Student(userId: $userId, firstName: $firstName, lastName: $lastName, fullName: $fullName, email: $email, phone: $phone, name: $name, enumCode: $enumCode, id: $id, studentNumber: $studentNumber, entranceDate: $entranceDate, unit: $unit, facultyName: $facultyName, programId: $programId, programName: $programName, yearOfBirth: $yearOfBirth, pictureUrl: $pictureUrl, grade: $grade, createdOn: $createdOn, modifiedOn: $modifiedOn, statusId: $statusId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Student &&
      other.userId == userId &&
      other.firstName == firstName &&
      other.lastName == lastName &&
      other.fullName == fullName &&
      other.email == email &&
      other.phone == phone &&
      other.name == name &&
      other.enumCode == enumCode &&
      other.id == id &&
      other.studentNumber == studentNumber &&
      other.entranceDate == entranceDate &&
      other.unit == unit &&
      other.facultyName == facultyName &&
      other.programId == programId &&
      other.programName == programName &&
      other.yearOfBirth == yearOfBirth &&
      other.pictureUrl == pictureUrl &&
      other.grade == grade &&
      other.createdOn == createdOn &&
      other.modifiedOn == modifiedOn &&
      other.statusId == statusId;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
      firstName.hashCode ^
      lastName.hashCode ^
      fullName.hashCode ^
      email.hashCode ^
      phone.hashCode ^
      name.hashCode ^
      enumCode.hashCode ^
      id.hashCode ^
      studentNumber.hashCode ^
      entranceDate.hashCode ^
      unit.hashCode ^
      facultyName.hashCode ^
      programId.hashCode ^
      programName.hashCode ^
      yearOfBirth.hashCode ^
      pictureUrl.hashCode ^
      grade.hashCode ^
      createdOn.hashCode ^
      modifiedOn.hashCode ^
      statusId.hashCode;
  }
}
