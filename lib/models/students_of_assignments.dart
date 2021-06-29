import 'dart:convert';

class StudentsOfAssignments {
  String? id;
  String? relationId;
  String? assingmentId;
  String? studentId;
  String? lecturerId;
  String? lectureId;
  String? studentNumber;
  String? studentName;
  String? lecturerName;
  String? lectureName;
  String? studentProgram;
  String? title;
  String? description;
  String? dueFrom;
  String? dueTo;
  int? statusId;
  int? academicYear;
  int? semester;
  StudentsOfAssignments({
    this.id,
    this.relationId,
    this.assingmentId,
    this.studentId,
    this.lecturerId,
    this.lectureId,
    this.studentNumber,
    this.studentName,
    this.lecturerName,
    this.lectureName,
    this.studentProgram,
    this.title,
    this.description,
    this.dueFrom,
    this.dueTo,
    this.statusId,
    this.academicYear,
    this.semester,
  });

  StudentsOfAssignments copyWith({
    String? id,
    String? relationId,
    String? assingmentId,
    String? studentId,
    String? lecturerId,
    String? lectureId,
    String? studentNumber,
    String? studentName,
    String? lecturerName,
    String? lectureName,
    String? studentProgram,
    String? title,
    String? description,
    String? dueFrom,
    String? dueTo,
    int? statusId,
    int? academicYear,
    int? semester,
  }) {
    return StudentsOfAssignments(
      id: id ?? this.id,
      relationId: relationId ?? this.relationId,
      assingmentId: assingmentId ?? this.assingmentId,
      studentId: studentId ?? this.studentId,
      lecturerId: lecturerId ?? this.lecturerId,
      lectureId: lectureId ?? this.lectureId,
      studentNumber: studentNumber ?? this.studentNumber,
      studentName: studentName ?? this.studentName,
      lecturerName: lecturerName ?? this.lecturerName,
      lectureName: lectureName ?? this.lectureName,
      studentProgram: studentProgram ?? this.studentProgram,
      title: title ?? this.title,
      description: description ?? this.description,
      dueFrom: dueFrom ?? this.dueFrom,
      dueTo: dueTo ?? this.dueTo,
      statusId: statusId ?? this.statusId,
      academicYear: academicYear ?? this.academicYear,
      semester: semester ?? this.semester,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'relationId': relationId,
      'assingmentId': assingmentId,
      'studentId': studentId,
      'lecturerId': lecturerId,
      'lectureId': lectureId,
      'studentNumber': studentNumber,
      'studentName': studentName,
      'lecturerName': lecturerName,
      'lectureName': lectureName,
      'studentProgram': studentProgram,
      'title': title,
      'description': description,
      'dueFrom': dueFrom,
      'dueTo': dueTo,
      'statusId': statusId,
      'academicYear': academicYear,
      'semester': semester,
    };
  }

  factory StudentsOfAssignments.fromMap(Map<String, dynamic> map) {
    return StudentsOfAssignments(
      id: map['id'],
      relationId: map['relationId'],
      assingmentId: map['assingmentId'],
      studentId: map['studentId'],
      lecturerId: map['lecturerId'],
      lectureId: map['lectureId'],
      studentNumber: map['studentNumber'],
      studentName: map['studentName'],
      lecturerName: map['lecturerName'],
      lectureName: map['lectureName'],
      studentProgram: map['studentProgram'],
      title: map['title'],
      description: map['description'],
      dueFrom: map['dueFrom'],
      dueTo: map['dueTo'],
      statusId: map['statusId'],
      academicYear: map['academicYear'],
      semester: map['semester'],
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentsOfAssignments.fromJson(String source) => StudentsOfAssignments.fromMap(json.decode(source));

  @override
  String toString() {
    return 'StudentsOfAssignments(id: $id, relationId: $relationId, assingmentId: $assingmentId, studentId: $studentId, lecturerId: $lecturerId, lectureId: $lectureId, studentNumber: $studentNumber, studentName: $studentName, lecturerName: $lecturerName, lectureName: $lectureName, studentProgram: $studentProgram, title: $title, description: $description, dueFrom: $dueFrom, dueTo: $dueTo, statusId: $statusId, academicYear: $academicYear, semester: $semester)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StudentsOfAssignments &&
        other.id == id &&
        other.relationId == relationId &&
        other.assingmentId == assingmentId &&
        other.studentId == studentId &&
        other.lecturerId == lecturerId &&
        other.lectureId == lectureId &&
        other.studentNumber == studentNumber &&
        other.studentName == studentName &&
        other.lecturerName == lecturerName &&
        other.lectureName == lectureName &&
        other.studentProgram == studentProgram &&
        other.title == title &&
        other.description == description &&
        other.dueFrom == dueFrom &&
        other.dueTo == dueTo &&
        other.statusId == statusId &&
        other.academicYear == academicYear &&
        other.semester == semester;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        relationId.hashCode ^
        assingmentId.hashCode ^
        studentId.hashCode ^
        lecturerId.hashCode ^
        lectureId.hashCode ^
        studentNumber.hashCode ^
        studentName.hashCode ^
        lecturerName.hashCode ^
        lectureName.hashCode ^
        studentProgram.hashCode ^
        title.hashCode ^
        description.hashCode ^
        dueFrom.hashCode ^
        dueTo.hashCode ^
        statusId.hashCode ^
        academicYear.hashCode ^
        semester.hashCode;
  }
}
