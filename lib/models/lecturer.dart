class Lecturer {
  String id;
  String userId;
  String title;
  String fullName;
  String facultyName;
  String department;
  String program;
  Lecturer({this.id, this.userId, this.title, this.fullName, this.facultyName, this.department, this.program});

  factory Lecturer.fromMap(Map<String, dynamic> json) => Lecturer(
        id: json["id"],
        userId: json["userId"],
        title: json["title"],
        fullName: json["fullName"],
        facultyName: json["facultyName"],
        department: json["department"],
        program: json["program"],
      );

  Map<String, dynamic> toMap() => {
        "id": this.id,
        "userId": this.userId,
        "title": this.title,
        "fullName": this.fullName,
        "facultyName": this.facultyName,
        "department": this.department,
        "program": this.program,
      };
}
