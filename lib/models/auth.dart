class Auth {
  String profileId;
  String role;
  String accessToken;
  String validUntil;

  Auth({
    this.profileId,
    this.role,
    this.accessToken,
    this.validUntil,
  });

  factory Auth.fromMap(Map<String, dynamic> json) {
    if (json == null) return null;
    return Auth(
      profileId: json["profileId"],
      role: json["role"],
      accessToken: json["accessToken"],
      validUntil: json["validUntil"],
    );
  }

  Map<String, dynamic> toMap() => {
        "profileId": this.profileId,
        "role": this.role,
        "accessToken": this.accessToken,
        "validUntil": this.validUntil,
      };
}
