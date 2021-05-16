class Student {
  String userId;
  String studentNumber;
  String entranceDate;
  String unit;
  String department;
  String program;
  int yearOfBirth;
  String pictureUrl;
  int grade;
  String createdOn;
  String modifiedOn;
  int status;

  Student({
    this.userId,
    this.studentNumber,
    this.entranceDate,
    this.unit,
    this.department,
    this.program,
    this.yearOfBirth,
    this.pictureUrl,
    this.grade,
    this.createdOn,
    this.modifiedOn,
    this.status,
  });

  factory Student.fromMap(Map<String, dynamic> json) {
    if (json == null) return null;
    return Student(
      userId: json["userId"],
      studentNumber: json["studentNumber"],
      entranceDate: json["entranceDate"],
      unit: json["unit"],
      department: json["department"],
      program: json["program"],
      yearOfBirth: json["yearOfBirth"],
      pictureUrl: json["pictureUrl"],
      grade: json["grade"],
      createdOn: json["createdOn"],
      modifiedOn: json["modifiedOn"],
      status: json["status"],
    );
  }

  Map<String, dynamic> toMap() => {
        "userId": this.userId,
        "studentNumber": this.studentNumber,
        "entranceDate": this.entranceDate,
        "unit": this.unit,
        "department": this.department,
        "program": this.program,
        "yearOfBirth": this.yearOfBirth,
        "pictureUrl": this.pictureUrl,
        "grade": this.grade,
        "createdOn": this.createdOn,
        "modifiedOn": this.modifiedOn,
        "status": this.status,
      };
}
