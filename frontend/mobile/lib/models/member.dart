class Member {
  int id;
  String name;
  String email;
  int schoolId;

  Member({
    required this.id,
    required this.name,
    required this.email,
    required this.schoolId,
  });

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      schoolId: json['school_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'school_id': schoolId,
    };
  }
}
