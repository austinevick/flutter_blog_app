import 'package:flutter/foundation.dart';
import 'package:flutter_blog_app/data/model/user.dart';



class Post {
  final int? id;
  final String? text;
  final String? image;
  final int? likes;
  final String? link;
  final List<String>? tags;
  final String? publishDate;
  final User? owner;
  Post({
    this.id,
    this.text,
    this.image,
    this.likes,
    this.link,
    this.tags,
    this.publishDate,
    this.owner,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'text': text,
      'image': image,
      'likes': likes,
      'link': link,
      'tags': tags,
      'publishDate': publishDate,
      'user': owner?.toMap(),
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['id']?.toInt(),
      text: map['text'],
      image: map['image'],
      likes: map['likes']?.toInt(),
      link: map['link'],
      tags: List<String>.from(map['tags']),
      publishDate: map['publishDate'],
      owner: map['owner'] != null ? User.fromMap(map['owner']) : null,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Post &&
        other.id == id &&
        other.text == text &&
        other.image == image &&
        other.likes == likes &&
        other.link == link &&
        listEquals(other.tags, tags) &&
        other.publishDate == publishDate &&
        other.owner == owner;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        text.hashCode ^
        image.hashCode ^
        likes.hashCode ^
        link.hashCode ^
        tags.hashCode ^
        publishDate.hashCode ^
        owner.hashCode;
  }
}
