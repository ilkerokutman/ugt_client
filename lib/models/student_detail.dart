import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:ugt_client/models/assignment.dart';
import 'package:ugt_client/models/lecture.dart';
import 'package:ugt_client/models/student.dart';

class StudentDetail {
  Student? student;
  List<AssignmentDetail>? assingments;
  List<Lecture>? lectures;
  StudentDetail({
    this.student,
    this.assingments,
    this.lectures,
  });

  factory StudentDetail.strach() => StudentDetail(
        student: null,
        assingments: <AssignmentDetail>[],
        lectures: <Lecture>[],
      );

  StudentDetail copyWith({
    Student? student,
    List<AssignmentDetail>? assingments,
    List<Lecture>? lectures,
  }) {
    return StudentDetail(
      student: student ?? this.student,
      assingments: assingments ?? this.assingments,
      lectures: lectures ?? this.lectures,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'student': student?.toMap(),
      'assingments': assingments?.map((x) => x.toMap()).toList(),
      'lectures': lectures?.map((x) => x.toMap()).toList(),
    };
  }

  factory StudentDetail.fromMap(Map<String, dynamic> map) {
    return StudentDetail(
      student: Student.fromMap(map['student']),
      assingments: List<AssignmentDetail>.from(map['assingments']?.map((x) => AssignmentDetail.fromMap(x))),
      lectures: List<Lecture>.from(map['lectures']?.map((x) => Lecture.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentDetail.fromJson(String source) => StudentDetail.fromMap(json.decode(source));

  @override
  String toString() => 'StudentDetail(student: $student, assingments: $assingments, lectures: $lectures)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StudentDetail &&
        other.student == student &&
        listEquals(other.assingments, assingments) &&
        listEquals(other.lectures, lectures);
  }

  @override
  int get hashCode => student.hashCode ^ assingments.hashCode ^ lectures.hashCode;
}
