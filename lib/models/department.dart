class Department {
  String id;
  String name;
  int statusId;
  int listOrder;
  String createdOn;
  String createdBy;
  String modifiedOn;
  String modifiedBy;
  Department({
    this.id,
    this.name,
    this.statusId,
    this.listOrder,
    this.createdBy,
    this.createdOn,
    this.modifiedBy,
    this.modifiedOn,
  });

  factory Department.fromMap(Map<String, dynamic> json) => Department(
        id: json["id"],
        name: json["name"],
        statusId: json["statusId"],
        listOrder: json["listOrder"],
        createdBy: json["createdBy"],
        createdOn: json["createdOn"],
        modifiedBy: json["modifiedBy"],
        modifiedOn: json["modifiedOn"],
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
      };
}
