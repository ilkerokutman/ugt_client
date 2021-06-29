import 'dart:convert';

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
