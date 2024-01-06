import 'package:flutter/material.dart';
import 'package:notepad/app/modules/draft/provider/draft_provider.dart';
import 'package:notepad/app/modules/edit_note/view/edit_note_view.dart';
import 'package:notepad/app/routes/custom_router.dart';
import 'package:provider/provider.dart';


class DraftView extends StatelessWidget {
  const DraftView({super.key,});


  @override
  Widget build(BuildContext context) {
    // final draftProvider = context.read<DraftProvider>();
    return Consumer<DraftProvider>(builder: (context, value, child) {
      return value.allDraftList.isEmpty?const Center(child: Text('No Draft'),):
      ListView.builder(
        itemCount: value.allDraftList.length,
        itemBuilder: (context, i) {
          //store all item in note variable
          final note = value.allDraftList[i];
          return ListTile(
            onTap: (){
              CustomRouter.push(context: context, page: EditNoteView(note: note, index: i,));
            },
            leading: Image.file(note.image),
            title: Text(note.title),
            subtitle: Text(note.description),
            trailing: const Icon(Icons.arrow_forward_ios),
          );
        },);
    },);
  }
}
