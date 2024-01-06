import 'package:flutter/material.dart';
import 'package:notepad/app/modules/createNote/widgets/save_button.dart';
import 'package:notepad/app/modules/createNote/widgets/select_gallery_widget.dart';
import 'package:notepad/app/modules/draft/provider/draft_provider.dart';
import 'package:notepad/utils/app_constant.dart';
import 'package:notepad/utils/custom_string.dart';
import 'package:notepad/widgets/k_description_field.dart';
import 'package:notepad/widgets/k_title_field.dart';
import 'package:provider/provider.dart';

import '../../note/provider/note_provider.dart';
import '../provider/create_note_provider.dart';

class CreateNoteView extends StatefulWidget {
  const CreateNoteView({super.key});
  @override
  State<CreateNoteView> createState() => _CreateNoteViewState();
}

class _CreateNoteViewState extends State<CreateNoteView> {

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   log('cleared!!!!!!!!!!!');
  //   final obj = context.read<CreateNoteProvider>().clearTextController();
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   final obj = context.read<CreateNoteProvider>();
  //   obj.titleCtrl.dispose();
  //   obj.descCtrl.dispose();
  //   log('dispose+++++++++++++++++');
  //
  // }

  @override
  Widget build(BuildContext context) {
    // final createNoteProvider = Provider.of<CreateNoteProvider>(context, listen: false);
    final createNoteProvider = context.read<CreateNoteProvider>();
    final draftProvider = context.read<DraftProvider>();
    final noteProvider = context.read<NoteProvider>();

    return WillPopScope(
        onWillPop: () async{
          //send data to draft list
         draftProvider.addDraftFunc(context: context);
      return true;
    }, child:Scaffold(
      appBar: AppBar(
        title: const Text(CustomString.createNoteTitle),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            Consumer<CreateNoteProvider>(
              builder: (context, value, child) {
                return value.uploadedImg == null ? const Text(CustomString.selectTxt):SizedBox(
                    height: 200,
                    child: Image.file(value.uploadedImg!)
                );
              },
            ),
            Consumer<CreateNoteProvider>(builder: (context, value, child) {
              return value.uploadedImg == null? const Text('')
                  :Text(value.uploadedImg!.path.split('/').last.toString());
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
              onPressed: () => noteProvider.addNoteFunc(context: context),
            ),

          ],
        ),
      ),
    ),);
  }
}
