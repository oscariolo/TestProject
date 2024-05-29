import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  String id;
  String title;
  String description;
  DateTime date;
  bool checked;
  String userId;
  Task({
    this.id = '',
    this.title = 'New Title',
    this.description = 'Description',
    DateTime? date,
    this.checked = false,
    this.userId = '',
  }) : date = date ?? DateTime.now();
  // Setters
  set setId(String id) {
    this.id = id;
  }

  set setTitle(String title) {
    this.title = title;
  }

  set setDescription(String description) {
    this.description = description;
  }

  set setDate(DateTime? date) {
    this.date = date ?? DateTime.now();
  }

  set setChecked(bool checked) {
    this.checked = checked;
  }

  // Getters
  String get getId {
    return id;
  }

  String get getTitle {
    return title;
  }

  String get getDescription {
    return description;
  }

  DateTime? get getDate {
    return date;
  }

  bool get getChecked {
    return checked;
  }

  factory Task.fromMap(Map<String, dynamic> map, [String? id]) {
    print("entered here");
    return Task(
      id: id ?? '',
      title: map['title'],
      description: map['description'],
      date: map['date'] != null ? (map['date'] as Timestamp).toDate() : null,
      checked: map['checked'],
      userId: map['userId'],
    );
  }
}
