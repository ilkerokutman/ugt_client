class Lecture {
  String id;
  String name;
  int statusId;
  int listOrder;
  String createdOn;
  String createdBy;
  String modifiedOn;
  String modifiedBy;
  String description;
  String code;
  int credits;
  String lecturer;
  String department;
  String unit;
  String program;
  int semester;
  int academicYear;
  Lecture({
    this.id,
    this.name,
    this.statusId,
    this.listOrder,
    this.createdBy,
    this.createdOn,
    this.modifiedBy,
    this.modifiedOn,
    this.description,
    this.code,
    this.credits,
    this.lecturer,
    this.department,
    this.unit,
    this.program,
    this.semester,
    this.academicYear,
  });
  factory Lecture.fromMap(Map<String, dynamic> json) => Lecture(
        id: json["id"],
        name: json["name"],
        statusId: json["statusId"],
        listOrder: json["listOrder"],
        createdBy: json["createdBy"],
        createdOn: json["createdOn"],
        modifiedBy: json["modifiedBy"],
        modifiedOn: json["modifiedOn"],
        description: json["description"],
        code: json["code"],
        credits: json["credits"],
        lecturer: json["lecturer"],
        department: json["department"],
        unit: json["unit"],
        program: json["program"],
        semester: json["semester"],
        academicYear: json["academicYear"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "statusId": statusId,
        "listOrder": listOrder,
        "createdBy": createdBy,
        "createdOn": createdOn,
        "modifiedBy": modifiedBy,
        "modifiedOn": modifiedOn,
        "description": description,
        "code": code,
        "credits": credits,
        "lecturer": lecturer,
        "department": department,
        "unit": unit,
        "program": program,
        "semester": semester,
        "academicYear": academicYear,
      };
}
