class User {
  int? id;
  String? name;
  String? image;

  User({required this.id, required this.name, required this.image});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'], name: json['first_name'], image: json['avatar']);
  }
}
