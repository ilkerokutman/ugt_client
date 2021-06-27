import 'dart:convert';

class DbEntity {
  String? id;
  String? name;
  int? statusId;
  DbEntity({
    this.id,
    this.name,
    this.statusId,
  });

  DbEntity copyWith({
    String? id,
    String? name,
    int? statusId,
  }) {
    return DbEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      statusId: statusId ?? this.statusId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'statusId': statusId,
    };
  }

  factory DbEntity.fromMap(Map<String, dynamic> map) {
    return DbEntity(
      id: map['id'],
      name: map['name'],
      statusId: map['statusId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DbEntity.fromJson(String source) => DbEntity.fromMap(json.decode(source));

  @override
  String toString() => 'DbEntity(id: $id, name: $name, statusId: $statusId)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is DbEntity &&
      other.id == id &&
      other.name == name &&
      other.statusId == statusId;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ statusId.hashCode;
}
