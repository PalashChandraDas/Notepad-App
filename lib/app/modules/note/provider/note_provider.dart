import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:notepad/utils/app_constant.dart';
import 'package:notepad/utils/custom_string.dart';
import 'package:provider/provider.dart';

import '../../../routes/custom_router.dart';
import '../../createNote/provider/create_note_provider.dart';
import '../../draft/model/draft_model.dart';

class NoteProvider extends ChangeNotifier {
  final List<NoteModel> _noteList = [];
  List<NoteModel> get allNoteList => _noteList;

  void addNote(NoteModel noteModel) {
    allNoteList.add(noteModel);
    log('note length====>${allNoteList.length.toString()}');
    notifyListeners();
  }

  void addNoteFunc({required BuildContext context}) async {
    final createNoteProvider = context.read<CreateNoteProvider>();

    if(createNoteProvider.isUploaded == true){
      //add note in list
      addNote(NoteModel(
          title: createNoteProvider.titleCtrl.text,
          description: createNoteProvider.descCtrl.text,
          image: File(createNoteProvider.uploadedImg!.path)
      ));
      CustomRouter.pop(context: context);
      createNoteProvider.clearAllValue();
    } else{
      log('empty+++++++');
      AppConstant.customToast(context: context, message: CustomString.toastButtonAction);
    }

  }



}
