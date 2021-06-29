import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:ugt_client/models/assignment.dart';
import 'package:ugt_client/models/students_of_assignments.dart';

class AssignmentDetail {
  Assignment? assignment;
  List<StudentsOfAssignments?>? students;
  AssignmentDetail({
    this.assignment,
    this.students,
  });

  AssignmentDetail copyWith({
    Assignment? assignment,
    List<StudentsOfAssignments?>? students,
  }) {
    return AssignmentDetail(
      assignment: assignment ?? this.assignment,
      students: students ?? this.students,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'assignment': assignment?.toMap(),
      'students': students?.map((x) => x?.toMap()).toList(),
    };
  }

  factory AssignmentDetail.fromMap(Map<String, dynamic> map) {
    return AssignmentDetail(
      assignment: Assignment.fromMap(map['assignment']),
      students: List<StudentsOfAssignments?>.from(map['students']?.map((x) => StudentsOfAssignments?.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory AssignmentDetail.fromJson(String source) => AssignmentDetail.fromMap(json.decode(source));

  @override
  String toString() => 'AssignmentDetail(assignment: $assignment, students: $students)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AssignmentDetail && other.assignment == assignment && listEquals(other.students, students);
  }

  @override
  int get hashCode => assignment.hashCode ^ students.hashCode;
}
