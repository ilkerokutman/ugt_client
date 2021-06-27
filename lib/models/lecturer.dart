import 'dart:convert';

class Lecturer {
  String? id;
  String? userId;
  String? title;
  String? fullName;
  String? facultyName;
  String? programName;
  String? role;
  String? programId;
  int? statusId;
  String? roleId;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  int? listOrder;
  String? createdOn;
  String? modifiedOn;
  Lecturer({
    this.id,
    this.userId,
    this.title,
    this.fullName,
    this.facultyName,
    this.programName,
    this.role,
    this.programId,
    this.statusId,
    this.roleId,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.listOrder,
    this.createdOn,
    this.modifiedOn,
  });
  

  Lecturer copyWith({
    String? id,
    String? userId,
    String? title,
    String? fullName,
    String? facultyName,
    String? programName,
    String? role,
    String? programId,
    int? statusId,
    String? roleId,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    int? listOrder,
    String? createdOn,
    String? modifiedOn,
  }) {
    return Lecturer(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      fullName: fullName ?? this.fullName,
      facultyName: facultyName ?? this.facultyName,
      programName: programName ?? this.programName,
      role: role ?? this.role,
      programId: programId ?? this.programId,
      statusId: statusId ?? this.statusId,
      roleId: roleId ?? this.roleId,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      listOrder: listOrder ?? this.listOrder,
      createdOn: createdOn ?? this.createdOn,
      modifiedOn: modifiedOn ?? this.modifiedOn,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'facultyName': facultyName,
      'programName': programName,
      'role': role,
      'programId': programId,
      'statusId': statusId,
      'roleId': roleId,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
    };
  }

  factory Lecturer.fromMap(Map<String, dynamic> map) {
    return Lecturer(
      id: map['id'],
      userId: map['userId'],
      title: map['title'],
      fullName: map['fullName'],
      facultyName: map['facultyName'],
      programName: map['programName'],
      role: map['role'],
      programId: map['programId'],
      statusId: map['statusId'],
      roleId: map['roleId'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      email: map['email'],
      phone: map['phone'],
      listOrder: map['listOrder'],
      createdOn: map['createdOn'],
      modifiedOn: map['modifiedOn'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Lecturer.fromJson(String source) => Lecturer.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Lecturer(id: $id, userId: $userId, title: $title, fullName: $fullName, facultyName: $facultyName, programName: $programName, role: $role, programId: $programId, statusId: $statusId, roleId: $roleId, firstName: $firstName, lastName: $lastName, email: $email, phone: $phone, listOrder: $listOrder, createdOn: $createdOn, modifiedOn: $modifiedOn)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Lecturer &&
      other.id == id &&
      other.userId == userId &&
      other.title == title &&
      other.fullName == fullName &&
      other.facultyName == facultyName &&
      other.programName == programName &&
      other.role == role &&
      other.programId == programId &&
      other.statusId == statusId &&
      other.roleId == roleId &&
      other.firstName == firstName &&
      other.lastName == lastName &&
      other.email == email &&
      other.phone == phone &&
      other.listOrder == listOrder &&
      other.createdOn == createdOn &&
      other.modifiedOn == modifiedOn;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      userId.hashCode ^
      title.hashCode ^
      fullName.hashCode ^
      facultyName.hashCode ^
      programName.hashCode ^
      role.hashCode ^
      programId.hashCode ^
      statusId.hashCode ^
      roleId.hashCode ^
      firstName.hashCode ^
      lastName.hashCode ^
      email.hashCode ^
      phone.hashCode ^
      listOrder.hashCode ^
      createdOn.hashCode ^
      modifiedOn.hashCode;
  }
}
