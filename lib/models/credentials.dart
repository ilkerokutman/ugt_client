class Credentials {
  String? username;
  String? password;
  Credentials({
    this.username,
    this.password,
  });
  factory Credentials.fromMap(Map<String, dynamic> map) {
    return Credentials(
      username: map["username"],
      password: map["password"],
    );
  }

  Map<String, dynamic> toMap() => {
        "username": this.username,
        "password": this.password,
      };
}
