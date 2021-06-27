import 'dart:convert';

class ProgramAndDivision {
  String? id;
  String? name;
  int? statusId;
  int? listOrder;
  String? createdOn;
  String? createdBy;
  String? modifiedOn;
  String? modifiedBy;
  String? facultyName;
  String? facultyId;
  ProgramAndDivision({
    this.id,
    this.name,
    this.statusId,
    this.listOrder,
    this.createdOn,
    this.createdBy,
    this.modifiedOn,
    this.modifiedBy,
    this.facultyName,
    this.facultyId,
  });

  ProgramAndDivision copyWith({
    String? id,
    String? name,
    int? statusId,
    int? listOrder,
    String? createdOn,
    String? createdBy,
    String? modifiedOn,
    String? modifiedBy,
    String? facultyName,
    String? facultyId,
  }) {
    return ProgramAndDivision(
      id: id ?? this.id,
      name: name ?? this.name,
      statusId: statusId ?? this.statusId,
      listOrder: listOrder ?? this.listOrder,
      createdOn: createdOn ?? this.createdOn,
      createdBy: createdBy ?? this.createdBy,
      modifiedOn: modifiedOn ?? this.modifiedOn,
      modifiedBy: modifiedBy ?? this.modifiedBy,
      facultyName: facultyName ?? this.facultyName,
      facultyId: facultyId ?? this.facultyId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'statusId': statusId,
      'listOrder': listOrder,
      'createdOn': createdOn,
      'createdBy': createdBy,
      'modifiedOn': modifiedOn,
      'modifiedBy': modifiedBy,
      'facultyName': facultyName,
      'facultyId': facultyId,
    };
  }

  factory ProgramAndDivision.fromMap(Map<String, dynamic> map) {
    return ProgramAndDivision(
      id: map['id'],
      name: map['name'],
      statusId: map['statusId'],
      listOrder: map['listOrder'],
      createdOn: map['createdOn'],
      createdBy: map['createdBy'],
      modifiedOn: map['modifiedOn'],
      modifiedBy: map['modifiedBy'],
      facultyName: map['facultyName'],
      facultyId: map['facultyId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProgramAndDivision.fromJson(String source) => ProgramAndDivision.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProgramAndDivision(id: $id, name: $name, statusId: $statusId, listOrder: $listOrder, createdOn: $createdOn, createdBy: $createdBy, modifiedOn: $modifiedOn, modifiedBy: $modifiedBy, facultyName: $facultyName, facultyId: $facultyId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ProgramAndDivision &&
      other.id == id &&
      other.name == name &&
      other.statusId == statusId &&
      other.listOrder == listOrder &&
      other.createdOn == createdOn &&
      other.createdBy == createdBy &&
      other.modifiedOn == modifiedOn &&
      other.modifiedBy == modifiedBy &&
      other.facultyName == facultyName &&
      other.facultyId == facultyId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      statusId.hashCode ^
      listOrder.hashCode ^
      createdOn.hashCode ^
      createdBy.hashCode ^
      modifiedOn.hashCode ^
      modifiedBy.hashCode ^
      facultyName.hashCode ^
      facultyId.hashCode;
  }
}
