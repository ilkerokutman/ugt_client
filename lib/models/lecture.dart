import 'dart:convert';

class Lecture {
  String? id;
  String? name;
  String? createdOn;
  String? modifiedOn;
  String? description;
  String? semester;
  String? lecturerId;
  String? facultyId;
  String? facultyName;
  String? lecturerName;
  String? programId;
  String? programName;
  String? code;
  int? academicYear;
  int? credits;
  int? statusId;
  Lecture({
    this.id,
    this.name,
    this.createdOn,
    this.modifiedOn,
    this.description,
    this.semester,
    this.lecturerId,
    this.facultyId,
    this.facultyName,
    this.lecturerName,
    this.programId,
    this.programName,
    this.code,
    this.academicYear,
    this.credits,
    this.statusId,
  });

  Lecture copyWith({
    String? id,
    String? name,
    String? createdOn,
    String? modifiedOn,
    String? description,
    String? semester,
    String? lecturerId,
    String? facultyId,
    String? facultyName,
    String? lecturerName,
    String? programId,
    String? programName,
    String? code,
    int? academicYear,
    int? credits,
    int? statusId,
  }) {
    return Lecture(
      id: id ?? this.id,
      name: name ?? this.name,
      createdOn: createdOn ?? this.createdOn,
      modifiedOn: modifiedOn ?? this.modifiedOn,
      description: description ?? this.description,
      semester: semester ?? this.semester,
      lecturerId: lecturerId ?? this.lecturerId,
      facultyId: facultyId ?? this.facultyId,
      facultyName: facultyName ?? this.facultyName,
      lecturerName: lecturerName ?? this.lecturerName,
      programId: programId ?? this.programId,
      programName: programName ?? this.programName,
      code: code ?? this.code,
      academicYear: academicYear ?? this.academicYear,
      credits: credits ?? this.credits,
      statusId: statusId ?? this.statusId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'createdOn': createdOn,
      'modifiedOn': modifiedOn,
      'description': description,
      'semester': semester,
      'lecturerId': lecturerId,
      'facultyId': facultyId,
      'facultyName': facultyName,
      'lecturerName': lecturerName,
      'programId': programId,
      'programName': programName,
      'code': code,
      'academicYear': academicYear,
      'credits': credits,
      'statusId': statusId,
    };
  }

  factory Lecture.fromMap(Map<String, dynamic> map) {
    return Lecture(
      id: map['id'],
      name: map['name'],
      createdOn: map['createdOn'],
      modifiedOn: map['modifiedOn'],
      description: map['description'],
      semester: map['semester'],
      lecturerId: map['lecturerId'],
      facultyId: map['facultyId'],
      facultyName: map['facultyName'],
      lecturerName: map['lecturerName'],
      programId: map['programId'],
      programName: map['programName'],
      code: map['code'],
      academicYear: map['academicYear'],
      credits: map['credits'],
      statusId: map['statusId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Lecture.fromJson(String source) => Lecture.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Lecture(id: $id, name: $name, createdOn: $createdOn, modifiedOn: $modifiedOn, description: $description, semester: $semester, lecturerId: $lecturerId, facultyId: $facultyId, facultyName: $facultyName, lecturerName: $lecturerName, programId: $programId, programName: $programName, code: $code, academicYear: $academicYear, credits: $credits, statusId: $statusId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Lecture &&
      other.id == id &&
      other.name == name &&
      other.createdOn == createdOn &&
      other.modifiedOn == modifiedOn &&
      other.description == description &&
      other.semester == semester &&
      other.lecturerId == lecturerId &&
      other.facultyId == facultyId &&
      other.facultyName == facultyName &&
      other.lecturerName == lecturerName &&
      other.programId == programId &&
      other.programName == programName &&
      other.code == code &&
      other.academicYear == academicYear &&
      other.credits == credits &&
      other.statusId == statusId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      createdOn.hashCode ^
      modifiedOn.hashCode ^
      description.hashCode ^
      semester.hashCode ^
      lecturerId.hashCode ^
      facultyId.hashCode ^
      facultyName.hashCode ^
      lecturerName.hashCode ^
      programId.hashCode ^
      programName.hashCode ^
      code.hashCode ^
      academicYear.hashCode ^
      credits.hashCode ^
      statusId.hashCode;
  }
}
