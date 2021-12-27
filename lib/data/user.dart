class User {
  final String? id;
  final String? title;
  final String? firstName;
  final String? lastName;
  final String? picture;
  User({
    this.id,
    this.title,
    this.firstName,
    this.lastName,
    this.picture,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'firstName': firstName,
      'lastName': lastName,
      'picture': picture,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      title: map['title'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      picture: map['picture'],
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.id == id &&
        other.title == title &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.picture == picture;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        picture.hashCode;
  }
}
