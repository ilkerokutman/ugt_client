import 'dart:convert';

class Assignment {
  String? id;
  String? title;
  int? statusId;
  String? description;
  String? program;
  Assignment({
    this.id,
    this.title,
    this.statusId,
    this.description,
    this.program,
  });

  Assignment copyWith({
    String? id,
    String? title,
    int? statusId,
    String? description,
    String? program,
  }) {
    return Assignment(
      id: id ?? this.id,
      title: title ?? this.title,
      statusId: statusId ?? this.statusId,
      description: description ?? this.description,
      program: program ?? this.program,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'statusId': statusId,
      'description': description,
      'program': program,
    };
  }

  factory Assignment.fromMap(Map<String, dynamic> map) {
    return Assignment(
      id: map['id'],
      title: map['title'],
      statusId: map['statusId'],
      description: map['description'],
      program: map['program'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Assignment.fromJson(String source) => Assignment.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Assignment(id: $id, title: $title, statusId: $statusId, description: $description, program: $program)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Assignment &&
      other.id == id &&
      other.title == title &&
      other.statusId == statusId &&
      other.description == description &&
      other.program == program;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      title.hashCode ^
      statusId.hashCode ^
      description.hashCode ^
      program.hashCode;
  }
}
