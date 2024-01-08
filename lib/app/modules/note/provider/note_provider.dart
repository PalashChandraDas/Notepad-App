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
      ///****Method****////////
      createNoteProvider.clearAllController();
      createNoteProvider.deleteImage();
    } else{
      log('empty+++++++');
      AppConstant.customToast(context: context, message: CustomString.toastButtonAction);
    }

  }

  void editNote({required NoteModel noteModel, required int index}){
    allNoteList[index] = noteModel;
    log('EditNot===> length: ${allNoteList.toString()}');
    notifyListeners();
  }


  void editNoteFunc({required BuildContext context, required int index}) {
    final createNoteProvider = context.read<CreateNoteProvider>();

    if(createNoteProvider.isUploaded == true){
      //add note in list
      editNote(noteModel: NoteModel(
          title: createNoteProvider.titleCtrl.text,
          description: createNoteProvider.descCtrl.text,
          image: File(createNoteProvider.uploadedImg!.path.toString())),
          index: index);
      CustomRouter.pop(context: context);
      // createNoteProvider.clearAllController();
    } else{
      log('empty+++++++');
      AppConstant.customToast(context: context, message: CustomString.toastButtonAction);
    }

  }



  void deleteNote(int index){
    allNoteList.removeAt(index);

    log('d length===>${allNoteList.length.toString()}');
    notifyListeners();
  }




}
