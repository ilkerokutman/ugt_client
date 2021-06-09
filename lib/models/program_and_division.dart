class ProgramAndDivision {
  String? id;
  String? name;
  int? statusId;
  int? listOrder;
  String? createdOn;
  String? createdBy;
  String? modifiedOn;
  String? modifiedBy;
  ProgramAndDivision({
    this.id,
    this.name,
    this.statusId,
    this.listOrder,
    this.createdBy,
    this.createdOn,
    this.modifiedBy,
    this.modifiedOn,
  });

  factory ProgramAndDivision.fromMap(Map<String, dynamic> json) => ProgramAndDivision(
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
