class Employee {
  final String id;
  final String name;
  final String email;
  final String image;

  Employee({
    required this.id,
    required this.name,
    required this.email,
    required this.image,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'image': image,
      };

  static Employee fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      image: json['image'] ?? '',
    );
  }
}
