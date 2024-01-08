import 'package:flutter/material.dart';
import 'package:notepad/app/modules/note/provider/note_provider.dart';
import 'package:notepad/app/routes/custom_router.dart';
import 'package:notepad/utils/custom_color.dart';
import 'package:notepad/utils/custom_string.dart';
import 'package:provider/provider.dart';

import '../../editNote/view/edit_note_view.dart';
import '../../note_detail/view/note_detail_view.dart';


class NoteView extends StatelessWidget {
  const NoteView({super.key,});



  @override
  Widget build(BuildContext context) {

    return Consumer<NoteProvider>(builder: (context, value, child) {
      return value.allNoteList.isEmpty?const Center(child: Text(CustomString.emptyNote),):
      SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.all(15),
          itemCount: value.allNoteList.length,
          itemBuilder: (context, i) {
            //store all item in note variable
            final note = value.allNoteList[i];
            return Container(
              margin: const EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                border: Border.all(color: CustomColor.primaryColor.withOpacity(.5))
              ),
              child: ListTile(
                onTap: () {
                  CustomRouter.push(context: context, page: NoteDetail(
                    note: note,
                  ));
                },
                leading: Image.file(note.image),
                title: Text(note.title),
                subtitle: Text(note.description),
                trailing: IconButton(
                  onPressed: () {
                    CustomRouter.push(context: context, page: EditNoteView(index: i,));
                  },
                  icon: const Icon(Icons.edit),
                ),
              ),
            );
          },),
      );
    },);
  }
}
