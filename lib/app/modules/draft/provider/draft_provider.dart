import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:notepad/app/modules/draft/model/draft_model.dart';
import 'package:provider/provider.dart';

import '../../../routes/custom_router.dart';
import '../../createNote/provider/create_note_provider.dart';

class DraftProvider extends ChangeNotifier{
  final List<NoteModel> _draftList = [];
  List<NoteModel> get allDraftList => _draftList;

  void addDraft(NoteModel draftModel){
    allDraftList.add(draftModel);
    log(allDraftList.toString());
    notifyListeners();
  }

  void editDraft({required NoteModel draftModel, required int index}){
    allDraftList.add(draftModel);
    allDraftList[index] = draftModel;

    log(allDraftList.toString());
    notifyListeners();
  }

  void deleteDraft(int index){
    allDraftList.removeAt(index);

    log('d length===>${allDraftList.length.toString()}');
    notifyListeners();
  }

  void addDraftFunc({required BuildContext context}) {
    final createNoteProvider = context.read<CreateNoteProvider>();
    addDraft(NoteModel(
        title: createNoteProvider.titleCtrl.text,
        description: createNoteProvider.descCtrl.text,
        image: File(createNoteProvider.uploadedImg!.path.toString())));
  }

  void editDraftFunc({required BuildContext context, required int index}) {
    final createNoteProvider = context.read<CreateNoteProvider>();
    editDraft(draftModel: NoteModel(
        title: createNoteProvider.titleCtrl.text,
        description: createNoteProvider.descCtrl.text,
        image: File(createNoteProvider.uploadedImg!.path.toString())),
        index: index);
    CustomRouter.pop(context: context);
  }




}