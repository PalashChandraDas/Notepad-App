import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../routes/custom_router.dart';
import '../../createNote/provider/create_note_provider.dart';
import '../../draft/model/draft_model.dart';

class NoteProvider extends ChangeNotifier {
  final List<NoteModel> _noteList = [];
  List<NoteModel> get allNoteList => _noteList;

  void addNote(NoteModel noteModel) {
    allNoteList.add(noteModel);
    log('note====>${allNoteList.toString()}');
    notifyListeners();
  }

  void addNoteFunc({required BuildContext context}) {
    final createNoteProvider = context.read<CreateNoteProvider>();
    addNote(NoteModel(
        title: createNoteProvider.titleCtrl.text,
        description: createNoteProvider.descCtrl.text,
        image: File(createNoteProvider.uploadedImg!.path.toString())));
    CustomRouter.pop(context: context);
  }
}
