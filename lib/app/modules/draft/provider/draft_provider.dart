import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:notepad/app/modules/draft/model/draft_model.dart';
import 'package:provider/provider.dart';

import '../../createNote/provider/create_note_provider.dart';

class DraftProvider extends ChangeNotifier{
  final List<NoteModel> _draftList = [];
  List<NoteModel> get allDraftList => _draftList;

  void addDraft(NoteModel draftModel){
    allDraftList.add(draftModel);
    log(allDraftList.toString());
    notifyListeners();
  }


  void addDraftFunc({required BuildContext context}) {
    final createNoteProvider = context.read<CreateNoteProvider>();
    addDraft(NoteModel(
        title: createNoteProvider.titleCtrl.text,
        description: createNoteProvider.descCtrl.text,
        image: File(createNoteProvider.uploadedImg!.path.toString())));
  }






}