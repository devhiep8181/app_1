// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TodoModel {
  final String uid;
  String title;
  String description;
  String startTime;
  String endTime;
  String isDone;
  TodoModel({
    required this.uid,
    required this.title,
    required this.description,
    required this.startTime,
    required this.endTime,
    required this.isDone,
  });

  TodoModel copyWith({
    String? uid,
    String? title,
    String? description,
    String? startTime,
    String? endTime,
    String? isDone,
  }) {
    return TodoModel(
      uid: uid ?? this.uid,
      title: title ?? this.title,
      description: description ?? this.description,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      isDone: isDone ?? this.isDone,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'title': title,
      'description': description,
      'startTime': startTime,
      'endTime': endTime,
      'isDone': isDone,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      uid: map['uid'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      startTime: map['startTime'] as String,
      endTime: map['endTime'] as String,
      isDone: map['isDone'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoModel.fromJson(String source) =>
      TodoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TodoModel(uid: $uid, title: $title, description: $description, startTime: $startTime, endTime: $endTime, isDone: $isDone)';
  }

  @override
  bool operator ==(covariant TodoModel other) {
    if (identical(this, other)) return true;

    return other.uid == uid &&
        other.title == title &&
        other.description == description &&
        other.startTime == startTime &&
        other.endTime == endTime &&
        other.isDone == isDone;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        title.hashCode ^
        description.hashCode ^
        startTime.hashCode ^
        endTime.hashCode ^
        isDone.hashCode;
  }
}
