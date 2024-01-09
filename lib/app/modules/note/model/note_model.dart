import 'dart:io';

class NoteModel{
  final String title;
  final String description;
  final File image;

  NoteModel({required this.title, required this.description, required this.image});
}