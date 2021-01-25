class Profile {
  String name;
  String email;

  Profile({this.name, this.email});

  Profile.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'];

  Map<String, dynamic> toJson() =>
      {
        'name': name,
        'email': email,
      };

  @override
  String toString() {
    return '$name : $email';
  }
}
