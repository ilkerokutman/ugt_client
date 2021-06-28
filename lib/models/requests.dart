import 'dart:convert';

class AssignmentRequest {
  String? title;
  String? description;
  AssignmentRequest({
    this.title,
    this.description,
  });

  AssignmentRequest copyWith({
    String? title,
    String? description,
  }) {
    return AssignmentRequest(
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
    };
  }

  factory AssignmentRequest.fromMap(Map<String, dynamic> map) {
    return AssignmentRequest(
      title: map['title'],
      description: map['description'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AssignmentRequest.fromJson(String source) => AssignmentRequest.fromMap(json.decode(source));

  @override
  String toString() => 'AssignmentRequest(title: $title, description: $description)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AssignmentRequest && other.title == title && other.description == description;
  }

  @override
  int get hashCode => title.hashCode ^ description.hashCode;
}

class LectureRequest {
  String? name;
  String? description;
  String? code;
  String? lecturer;
  String? program;
  int? credits;
  String? semester;
  int? academicYear;
  LectureRequest({
    this.name,
    this.description,
    this.code,
    this.lecturer,
    this.program,
    this.credits,
    this.semester,
    this.academicYear,
  });

  LectureRequest copyWith({
    String? name,
    String? description,
    String? code,
    String? lecturer,
    String? program,
    int? credits,
    String? semester,
    int? academicYear,
  }) {
    return LectureRequest(
      name: name ?? this.name,
      description: description ?? this.description,
      code: code ?? this.code,
      lecturer: lecturer ?? this.lecturer,
      program: program ?? this.program,
      credits: credits ?? this.credits,
      semester: semester ?? this.semester,
      academicYear: academicYear ?? this.academicYear,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'code': code,
      'lecturer': lecturer,
      'program': program,
      'credits': credits,
      'semester': semester,
      'academicYear': academicYear,
    };
  }

  factory LectureRequest.fromMap(Map<String, dynamic> map) {
    return LectureRequest(
      name: map['name'],
      description: map['description'],
      code: map['code'],
      lecturer: map['lecturer'],
      program: map['program'],
      credits: map['credits'],
      semester: map['semester'],
      academicYear: map['academicYear'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LectureRequest.fromJson(String source) => LectureRequest.fromMap(json.decode(source));

  @override
  String toString() {
    return 'LectureRequest(name: $name, description: $description, code: $code, lecturer: $lecturer, program: $program, credits: $credits, semester: $semester, academicYear: $academicYear)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LectureRequest &&
        other.name == name &&
        other.description == description &&
        other.code == code &&
        other.lecturer == lecturer &&
        other.program == program &&
        other.credits == credits &&
        other.semester == semester &&
        other.academicYear == academicYear;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        description.hashCode ^
        code.hashCode ^
        lecturer.hashCode ^
        program.hashCode ^
        credits.hashCode ^
        semester.hashCode ^
        academicYear.hashCode;
  }
}

class StudentRequest {
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? phone;
  String? role;
  String? programId;
  String? studentNumber;
  String? entranceDate;
  int? yearOfBirth;
  int? grade;
  StudentRequest({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.phone,
    this.role,
    this.programId,
    this.studentNumber,
    this.entranceDate,
    this.yearOfBirth,
    this.grade,
  });

  StudentRequest copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? phone,
    String? role,
    String? programId,
    String? studentNumber,
    String? entranceDate,
    int? yearOfBirth,
    int? grade,
  }) {
    return StudentRequest(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
      phone: phone ?? this.phone,
      role: role ?? this.role,
      programId: programId ?? this.programId,
      studentNumber: studentNumber ?? this.studentNumber,
      entranceDate: entranceDate ?? this.entranceDate,
      yearOfBirth: yearOfBirth ?? this.yearOfBirth,
      grade: grade ?? this.grade,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'phone': phone,
      'role': role,
      'programId': programId,
      'studentNumber': studentNumber,
      'entranceDate': entranceDate,
      'yearOfBirth': yearOfBirth,
      'grade': grade,
    };
  }

  factory StudentRequest.fromMap(Map<String, dynamic> map) {
    return StudentRequest(
      firstName: map['firstName'],
      lastName: map['lastName'],
      email: map['email'],
      password: map['password'],
      phone: map['phone'],
      role: map['role'],
      programId: map['programId'],
      studentNumber: map['studentNumber'],
      entranceDate: map['entranceDate'],
      yearOfBirth: map['yearOfBirth'],
      grade: map['grade'],
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentRequest.fromJson(String source) => StudentRequest.fromMap(json.decode(source));

  @override
  String toString() {
    return 'StudentRequest(firstName: $firstName, lastName: $lastName, email: $email, password: $password, phone: $phone, role: $role, programId: $programId, studentNumber: $studentNumber, entranceDate: $entranceDate, yearOfBirth: $yearOfBirth, grade: $grade)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StudentRequest &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.email == email &&
        other.password == password &&
        other.phone == phone &&
        other.role == role &&
        other.programId == programId &&
        other.studentNumber == studentNumber &&
        other.entranceDate == entranceDate &&
        other.yearOfBirth == yearOfBirth &&
        other.grade == grade;
  }

  @override
  int get hashCode {
    return firstName.hashCode ^
        lastName.hashCode ^
        email.hashCode ^
        password.hashCode ^
        phone.hashCode ^
        role.hashCode ^
        programId.hashCode ^
        studentNumber.hashCode ^
        entranceDate.hashCode ^
        yearOfBirth.hashCode ^
        grade.hashCode;
  }
}

class LecturerRequest {
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? phone;
  String? role;
  String? title;
  String? programId;
  String? departmentId;
  LecturerRequest({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.phone,
    this.role,
    this.title,
    this.programId,
    this.departmentId,
  });

  LecturerRequest copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? phone,
    String? role,
    String? title,
    String? programId,
    String? departmentId,
  }) {
    return LecturerRequest(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
      phone: phone ?? this.phone,
      role: role ?? this.role,
      title: title ?? this.title,
      programId: programId ?? this.programId,
      departmentId: departmentId ?? this.departmentId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'phone': phone,
      'role': role,
      'title': title,
      'programId': programId,
      'departmentId': departmentId,
    };
  }

  factory LecturerRequest.fromMap(Map<String, dynamic> map) {
    return LecturerRequest(
      firstName: map['firstName'],
      lastName: map['lastName'],
      email: map['email'],
      password: map['password'],
      phone: map['phone'],
      role: map['role'],
      title: map['title'],
      programId: map['programId'],
      departmentId: map['departmentId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LecturerRequest.fromJson(String source) => LecturerRequest.fromMap(json.decode(source));

  @override
  String toString() {
    return 'LecturerRequest(firstName: $firstName, lastName: $lastName, email: $email, password: $password, phone: $phone, role: $role, title: $title, programId: $programId, departmentId: $departmentId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LecturerRequest &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.email == email &&
        other.password == password &&
        other.phone == phone &&
        other.role == role &&
        other.title == title &&
        other.programId == programId &&
        other.departmentId == departmentId;
  }

  @override
  int get hashCode {
    return firstName.hashCode ^
        lastName.hashCode ^
        email.hashCode ^
        password.hashCode ^
        phone.hashCode ^
        role.hashCode ^
        title.hashCode ^
        programId.hashCode ^
        departmentId.hashCode;
  }
}

class ProgramRequest {
  String? name;
  String? facultyId;
  ProgramRequest({
    this.name,
    this.facultyId,
  });

  ProgramRequest copyWith({
    String? name,
    String? facultyId,
  }) {
    return ProgramRequest(
      name: name ?? this.name,
      facultyId: facultyId ?? this.facultyId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'facultyId': facultyId,
    };
  }

  factory ProgramRequest.fromMap(Map<String, dynamic> map) {
    return ProgramRequest(
      name: map['name'],
      facultyId: map['facultyId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProgramRequest.fromJson(String source) => ProgramRequest.fromMap(json.decode(source));

  @override
  String toString() => 'ProgramRequest(name: $name, facultyId: $facultyId)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProgramRequest && other.name == name && other.facultyId == facultyId;
  }

  @override
  int get hashCode => name.hashCode ^ facultyId.hashCode;
}

class DepartmentRequest {
  String? name;
  String? facultyId;
  DepartmentRequest({
    this.name,
    this.facultyId,
  });

  DepartmentRequest copyWith({
    String? name,
    String? facultyId,
  }) {
    return DepartmentRequest(
      name: name ?? this.name,
      facultyId: facultyId ?? this.facultyId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'facultyId': facultyId,
    };
  }

  factory DepartmentRequest.fromMap(Map<String, dynamic> map) {
    return DepartmentRequest(
      name: map['name'],
      facultyId: map['facultyId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DepartmentRequest.fromJson(String source) => DepartmentRequest.fromMap(json.decode(source));

  @override
  String toString() => 'DepartmentRequest(name: $name, facultyId: $facultyId)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DepartmentRequest && other.name == name && other.facultyId == facultyId;
  }

  @override
  int get hashCode => name.hashCode ^ facultyId.hashCode;
}
