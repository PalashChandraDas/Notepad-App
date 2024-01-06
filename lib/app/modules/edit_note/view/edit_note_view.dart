import 'package:flutter/material.dart';
import 'package:notepad/app/modules/createNote/widgets/save_button.dart';
import 'package:notepad/app/modules/createNote/widgets/select_gallery_widget.dart';
import 'package:notepad/app/modules/draft/model/draft_model.dart';
import 'package:notepad/app/modules/note/provider/note_provider.dart';
import 'package:notepad/utils/app_constant.dart';
import 'package:notepad/utils/custom_string.dart';
import 'package:notepad/widgets/k_description_field.dart';
import 'package:notepad/widgets/k_title_field.dart';
import 'package:provider/provider.dart';

import '../../createNote/provider/create_note_provider.dart';

class EditNoteView extends StatefulWidget {
  const EditNoteView({super.key, required this.note, required this.index});
  final NoteModel note;
  final int index;


  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {


  @override
  Widget build(BuildContext context) {
    // final createNoteProvider = Provider.of<CreateNoteProvider>(context, listen: false);
    final createNoteProvider = context.read<CreateNoteProvider>();
    final noteProvider = context.read<NoteProvider>();


    return Scaffold(
      appBar: AppBar(
        title: Text(CustomString.editDraftTitle),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            Consumer<CreateNoteProvider>(
              builder: (context, value, child) {
                return value.uploadedImg == null ? const Text(CustomString.selectTxt):SizedBox(
                    height: 200,
                    child: Image.file(widget.note.image)
                );
              },
            ),
            Consumer<CreateNoteProvider>(builder: (context, value, child) {
              return value.uploadedImg == null? const Text('')
                  :Text(widget.note.image.path.split('/').last.toString());
            },),
            const SizedBox(height: 20,),
            Consumer<CreateNoteProvider>(builder: (context, value, child) {
              return SelectGalleryWidget(
                isChangeColor: value.isUploaded,
                onPressed: () => value.showOptions(context: context),
              );
            },),
            KTitleField(controller: createNoteProvider.titleCtrl),
            AppConstant.kDefaultGap,
            KDescriptionField(controller: createNoteProvider.descCtrl),
            const SizedBox(
              height: 50,
            ),
            SaveButton(
              onPressed: () {
                noteProvider.addNoteFunc(context: context);
              },
            ),

          ],
        ),
      ),
    );
  }
}
