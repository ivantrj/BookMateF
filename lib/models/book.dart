// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

enum BookStatus { wantToRead, reading, read }

class Book {
  final int id;
  final String title;

  Book({
    required this.id,
    required this.title,
    this.status = BookStatus.wantToRead,
  });
  BookStatus status;

  Book copyWith({
    int? id,
    String? title,
  }) {
    return Book(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
    };
  }

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      id: map['id'] as int,
      title: map['title'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Book.fromJson(String source) => Book.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Book(id: $id, title: $title)';

  @override
  bool operator ==(covariant Book other) {
    if (identical(this, other)) return true;

    return other.id == id && other.title == title;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode;

  factory Book.fromSqfliteDatabase(Map<String, dynamic> map) {
    return Book(
      id: map['id'] as int,
      title: map['title'] as String,
    );
  }
}
