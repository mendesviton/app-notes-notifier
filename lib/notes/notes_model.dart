import 'dart:convert';

class NotesModel {
  String title;
  String? description;
  NotesModel({
    required this.title,
    this.description,
  });

  factory NotesModel.fromMap(Map<String, dynamic> map) {
    return NotesModel(
      title: map['title'] ?? '',
      description: map['description'],
    );
  }
}
