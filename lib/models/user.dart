class User {
  final String id;
  final String name;
  final String email;
  final String password;
  final List<String> favoriteProducts;
  final DateTime createdAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    this.favoriteProducts = const [],
    required this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'favoriteProducts': favoriteProducts,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      favoriteProducts: List<String>.from(json['favoriteProducts'] ?? []),
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    List<String>? favoriteProducts,
    DateTime? createdAt,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      favoriteProducts: favoriteProducts ?? this.favoriteProducts,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
