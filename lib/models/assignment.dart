import 'dart:convert';

class AssignmentDetail {
  String? id;
  String? assingmentId;
  String? studentId;
  String? lecturerId;
  String? createdOn;
  String? modifiedOn;
  String? semester;
  String? dueFrom;
  String? dueTo;
  String? studentName;
  String? studentNumber;
  String? title;
  String? description;
  String? assetUrl;
  String? lectureName;
  String? lectureCode;
  String? studentProgramName;
  String? lecturerProgramName;
  String? lecturerName;
  int? isTemplate;
  int? academicYear;
  int? lectureAcademicYear;
  int? studentGrade;
  int? statusId;
  AssignmentDetail({
    this.id,
    this.assingmentId,
    this.studentId,
    this.lecturerId,
    this.createdOn,
    this.modifiedOn,
    this.semester,
    this.dueFrom,
    this.dueTo,
    this.studentName,
    this.studentNumber,
    this.title,
    this.description,
    this.assetUrl,
    this.lectureName,
    this.lectureCode,
    this.studentProgramName,
    this.lecturerProgramName,
    this.lecturerName,
    this.isTemplate,
    this.academicYear,
    this.lectureAcademicYear,
    this.studentGrade,
    this.statusId,
  });

  AssignmentDetail copyWith({
    String? id,
    String? assingmentId,
    String? studentId,
    String? lecturerId,
    String? createdOn,
    String? modifiedOn,
    String? semester,
    String? dueFrom,
    String? dueTo,
    String? studentName,
    String? studentNumber,
    String? title,
    String? description,
    String? assetUrl,
    String? lectureName,
    String? lectureCode,
    String? studentProgramName,
    String? lecturerProgramName,
    String? lecturerName,
    int? isTemplate,
    int? academicYear,
    int? lectureAcademicYear,
    int? studentGrade,
    int? statusId,
  }) {
    return AssignmentDetail(
      id: id ?? this.id,
      assingmentId: assingmentId ?? this.assingmentId,
      studentId: studentId ?? this.studentId,
      lecturerId: lecturerId ?? this.lecturerId,
      createdOn: createdOn ?? this.createdOn,
      modifiedOn: modifiedOn ?? this.modifiedOn,
      semester: semester ?? this.semester,
      dueFrom: dueFrom ?? this.dueFrom,
      dueTo: dueTo ?? this.dueTo,
      studentName: studentName ?? this.studentName,
      studentNumber: studentNumber ?? this.studentNumber,
      title: title ?? this.title,
      description: description ?? this.description,
      assetUrl: assetUrl ?? this.assetUrl,
      lectureName: lectureName ?? this.lectureName,
      lectureCode: lectureCode ?? this.lectureCode,
      studentProgramName: studentProgramName ?? this.studentProgramName,
      lecturerProgramName: lecturerProgramName ?? this.lecturerProgramName,
      lecturerName: lecturerName ?? this.lecturerName,
      isTemplate: isTemplate ?? this.isTemplate,
      academicYear: academicYear ?? this.academicYear,
      lectureAcademicYear: lectureAcademicYear ?? this.lectureAcademicYear,
      studentGrade: studentGrade ?? this.studentGrade,
      statusId: statusId ?? this.statusId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'assingmentId': assingmentId,
      'studentId': studentId,
      'lecturerId': lecturerId,
      'createdOn': createdOn,
      'modifiedOn': modifiedOn,
      'semester': semester,
      'dueFrom': dueFrom,
      'dueTo': dueTo,
      'studentName': studentName,
      'studentNumber': studentNumber,
      'title': title,
      'description': description,
      'assetUrl': assetUrl,
      'lectureName': lectureName,
      'lectureCode': lectureCode,
      'studentProgramName': studentProgramName,
      'lecturerProgramName': lecturerProgramName,
      'lecturerName': lecturerName,
      'isTemplate': isTemplate,
      'academicYear': academicYear,
      'lectureAcademicYear': lectureAcademicYear,
      'studentGrade': studentGrade,
      'statusId': statusId,
    };
  }

  factory AssignmentDetail.fromMap(Map<String, dynamic> map) {
    return AssignmentDetail(
      id: map['id'],
      assingmentId: map['assingmentId'],
      studentId: map['studentId'],
      lecturerId: map['lecturerId'],
      createdOn: map['createdOn'],
      modifiedOn: map['modifiedOn'],
      semester: map['semester'],
      dueFrom: map['dueFrom'],
      dueTo: map['dueTo'],
      studentName: map['studentName'],
      studentNumber: map['studentNumber'],
      title: map['title'],
      description: map['description'],
      assetUrl: map['assetUrl'],
      lectureName: map['lectureName'],
      lectureCode: map['lectureCode'],
      studentProgramName: map['studentProgramName'],
      lecturerProgramName: map['lecturerProgramName'],
      lecturerName: map['lecturerName'],
      isTemplate: map['isTemplate'],
      academicYear: map['academicYear'],
      lectureAcademicYear: map['lectureAcademicYear'],
      studentGrade: map['studentGrade'],
      statusId: map['statusId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AssignmentDetail.fromJson(String source) => AssignmentDetail.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AssingmentDetail(id: $id, assingmentId: $assingmentId, studentId: $studentId, lecturerId: $lecturerId, createdOn: $createdOn, modifiedOn: $modifiedOn, semester: $semester, dueFrom: $dueFrom, dueTo: $dueTo, studentName: $studentName, studentNumber: $studentNumber, title: $title, description: $description, assetUrl: $assetUrl, lectureName: $lectureName, lectureCode: $lectureCode, studentProgramName: $studentProgramName, lecturerProgramName: $lecturerProgramName, lecturerName: $lecturerName, isTemplate: $isTemplate, academicYear: $academicYear, lectureAcademicYear: $lectureAcademicYear, studentGrade: $studentGrade, statusId: $statusId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is AssignmentDetail &&
      other.id == id &&
      other.assingmentId == assingmentId &&
      other.studentId == studentId &&
      other.lecturerId == lecturerId &&
      other.createdOn == createdOn &&
      other.modifiedOn == modifiedOn &&
      other.semester == semester &&
      other.dueFrom == dueFrom &&
      other.dueTo == dueTo &&
      other.studentName == studentName &&
      other.studentNumber == studentNumber &&
      other.title == title &&
      other.description == description &&
      other.assetUrl == assetUrl &&
      other.lectureName == lectureName &&
      other.lectureCode == lectureCode &&
      other.studentProgramName == studentProgramName &&
      other.lecturerProgramName == lecturerProgramName &&
      other.lecturerName == lecturerName &&
      other.isTemplate == isTemplate &&
      other.academicYear == academicYear &&
      other.lectureAcademicYear == lectureAcademicYear &&
      other.studentGrade == studentGrade &&
      other.statusId == statusId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      assingmentId.hashCode ^
      studentId.hashCode ^
      lecturerId.hashCode ^
      createdOn.hashCode ^
      modifiedOn.hashCode ^
      semester.hashCode ^
      dueFrom.hashCode ^
      dueTo.hashCode ^
      studentName.hashCode ^
      studentNumber.hashCode ^
      title.hashCode ^
      description.hashCode ^
      assetUrl.hashCode ^
      lectureName.hashCode ^
      lectureCode.hashCode ^
      studentProgramName.hashCode ^
      lecturerProgramName.hashCode ^
      lecturerName.hashCode ^
      isTemplate.hashCode ^
      academicYear.hashCode ^
      lectureAcademicYear.hashCode ^
      studentGrade.hashCode ^
      statusId.hashCode;
  }
}

class Assignment {
  String? id;
  String? createdOn;
  String? modifiedOn;
  String? typeId;
  String? typeName;
  String? title;
  String? description;
  String? assetUrl;
  String? programId;
  String? programName;
  String? lectureId;
  String? lectureName;
  String? lecturerId;
  String? lecturerName;
  String? dueFrom;
  String? dueTo;
  int? academicYear;
  int? semester;
  int? statusId;
  int? isTemplate;
  Assignment({
    this.id,
    this.createdOn,
    this.modifiedOn,
    this.typeId,
    this.typeName,
    this.title,
    this.description,
    this.assetUrl,
    this.programId,
    this.programName,
    this.lectureId,
    this.lectureName,
    this.lecturerId,
    this.lecturerName,
    this.dueFrom,
    this.dueTo,
    this.academicYear,
    this.semester,
    this.statusId,
    this.isTemplate,
  });

  Assignment copyWith({
    String? id,
    String? createdOn,
    String? modifiedOn,
    String? typeId,
    String? typeName,
    String? title,
    String? description,
    String? assetUrl,
    String? programId,
    String? programName,
    String? lectureId,
    String? lectureName,
    String? lecturerId,
    String? lecturerName,
    String? dueFrom,
    String? dueTo,
    int? academicYear,
    int? semester,
    int? statusId,
    int? isTemplate,
  }) {
    return Assignment(
      id: id ?? this.id,
      createdOn: createdOn ?? this.createdOn,
      modifiedOn: modifiedOn ?? this.modifiedOn,
      typeId: typeId ?? this.typeId,
      typeName: typeName ?? this.typeName,
      title: title ?? this.title,
      description: description ?? this.description,
      assetUrl: assetUrl ?? this.assetUrl,
      programId: programId ?? this.programId,
      programName: programName ?? this.programName,
      lectureId: lectureId ?? this.lectureId,
      lectureName: lectureName ?? this.lectureName,
      lecturerId: lecturerId ?? this.lecturerId,
      lecturerName: lecturerName ?? this.lecturerName,
      dueFrom: dueFrom ?? this.dueFrom,
      dueTo: dueTo ?? this.dueTo,
      academicYear: academicYear ?? this.academicYear,
      semester: semester ?? this.semester,
      statusId: statusId ?? this.statusId,
      isTemplate: isTemplate ?? this.isTemplate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'createdOn': createdOn,
      'modifiedOn': modifiedOn,
      'typeId': typeId,
      'typeName': typeName,
      'title': title,
      'description': description,
      'assetUrl': assetUrl,
      'programId': programId,
      'programName': programName,
      'lectureId': lectureId,
      'lectureName': lectureName,
      'lecturerId': lecturerId,
      'lecturerName': lecturerName,
      'dueFrom': dueFrom,
      'dueTo': dueTo,
      'academicYear': academicYear,
      'semester': semester,
      'statusId': statusId,
      'isTemplate': isTemplate,
    };
  }

  factory Assignment.fromMap(Map<String, dynamic> map) {
    return Assignment(
      id: map['id'],
      createdOn: map['createdOn'],
      modifiedOn: map['modifiedOn'],
      typeId: map['typeId'],
      typeName: map['typeName'],
      title: map['title'],
      description: map['description'],
      assetUrl: map['assetUrl'],
      programId: map['programId'],
      programName: map['programName'],
      lectureId: map['lectureId'],
      lectureName: map['lectureName'],
      lecturerId: map['lecturerId'],
      lecturerName: map['lecturerName'],
      dueFrom: map['dueFrom'],
      dueTo: map['dueTo'],
      academicYear: map['academicYear'],
      semester: map['semester'],
      statusId: map['statusId'],
      isTemplate: map['isTemplate'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Assignment.fromJson(String source) => Assignment.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Assignment(id: $id, createdOn: $createdOn, modifiedOn: $modifiedOn, typeId: $typeId, typeName: $typeName, title: $title, description: $description, assetUrl: $assetUrl, programId: $programId, programName: $programName, lectureId: $lectureId, lectureName: $lectureName, lecturerId: $lecturerId, lecturerName: $lecturerName, dueFrom: $dueFrom, dueTo: $dueTo, academicYear: $academicYear, semester: $semester, statusId: $statusId, isTemplate: $isTemplate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Assignment &&
        other.id == id &&
        other.createdOn == createdOn &&
        other.modifiedOn == modifiedOn &&
        other.typeId == typeId &&
        other.typeName == typeName &&
        other.title == title &&
        other.description == description &&
        other.assetUrl == assetUrl &&
        other.programId == programId &&
        other.programName == programName &&
        other.lectureId == lectureId &&
        other.lectureName == lectureName &&
        other.lecturerId == lecturerId &&
        other.lecturerName == lecturerName &&
        other.dueFrom == dueFrom &&
        other.dueTo == dueTo &&
        other.academicYear == academicYear &&
        other.semester == semester &&
        other.statusId == statusId &&
        other.isTemplate == isTemplate;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        createdOn.hashCode ^
        modifiedOn.hashCode ^
        typeId.hashCode ^
        typeName.hashCode ^
        title.hashCode ^
        description.hashCode ^
        assetUrl.hashCode ^
        programId.hashCode ^
        programName.hashCode ^
        lectureId.hashCode ^
        lectureName.hashCode ^
        lecturerId.hashCode ^
        lecturerName.hashCode ^
        dueFrom.hashCode ^
        dueTo.hashCode ^
        academicYear.hashCode ^
        semester.hashCode ^
        statusId.hashCode ^
        isTemplate.hashCode;
  }
}
