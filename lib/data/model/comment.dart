import 'package:flutter_blog_app/data/model/user.dart';

class Comment {
  final int? id;
  final String? message;
  final String? post;
  final String? publishDate;
  final User? owner;
  Comment({
    this.id,
    this.message,
    this.post,
    this.publishDate,
    this.owner,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'message': message,
      'post': post,
      'publishDate': publishDate,
      'owner': owner?.toMap(),
    };
  }

  factory Comment.fromMap(Map<String, dynamic> map) {
    return Comment(
      id: map['id']?.toInt(),
      message: map['message'],
      post: map['post'],
      publishDate: map['publishDate'],
      owner: map['owner'] != null ? User.fromMap(map['owner']) : null,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Comment &&
        other.id == id &&
        other.message == message &&
        other.post == post &&
        other.publishDate == publishDate &&
        other.owner == owner;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        message.hashCode ^
        post.hashCode ^
        publishDate.hashCode ^
        owner.hashCode;
  }
}
