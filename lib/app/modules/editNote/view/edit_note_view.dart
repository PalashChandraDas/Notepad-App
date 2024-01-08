import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notepad/utils/custom_color.dart';
import 'package:notepad/widgets/save_button.dart';
import 'package:notepad/utils/app_constant.dart';
import 'package:notepad/utils/custom_string.dart';
import 'package:notepad/widgets/k_description_field.dart';
import 'package:notepad/widgets/k_title_field.dart';
import 'package:provider/provider.dart';

import '../../../../widgets/delete_image_button.dart';
import '../../../../widgets/k_image_file.dart';
import '../../../../widgets/select_img_button.dart';
import '../../createNote/provider/create_note_provider.dart';
import '../../note/provider/note_provider.dart';

class EditNoteView extends StatefulWidget {
  const EditNoteView({super.key, required this.index});
  final int index;

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  @override
  Widget build(BuildContext context) {
    //declare instance
    final noteProvider = context.read<NoteProvider>();
    final createNoteProvider = context.read<CreateNoteProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text(CustomString.editNoteTitle),
        actions: [
          SaveButton(
            onPressed: () {
              noteProvider.editNoteFunc(context: context, index: widget.index);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: Column(
          children: [
            //UPLOADED IMAGE
            Consumer<CreateNoteProvider>(
              builder: (_, value, child) {
                return value.uploadedImg == null
                    ? SelectImageButton(
                  isIconSize: true,
                  isChangeColor: value.isUploaded,
                  onPressed: () => value.showOptions(context: context),
                )
                    : KImageFile(
                  imageFile: value.uploadedImg!,
                );
              },
            ),
            //IMAGE PATH
            Consumer<CreateNoteProvider>(
              builder: (context, value, child) {
                return value.uploadedImg == null
                    ? const Text(
                  CustomString.selectTxt,
                  style: TextStyle(color: CustomColor.textHintColor),
                )
                    : Text(value.currentImagePath());
              },
            ),
            20.verticalSpace,
            //IMAGE AND CLEAR BUTTON
            Consumer<CreateNoteProvider>(
              builder: (context, value, child) {
                return value.isUploaded == true
                    ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SelectImageButton(
                      isChangeColor: value.isUploaded,
                      onPressed: () =>
                          value.showOptions(context: context),
                    ),
                    deleteImageButton(onPressed: () {
                      value.deleteImage();
                    })
                  ],
                )
                    : const SizedBox();
              },
            ),
            KTitleField(controller: createNoteProvider.titleCtrl),
            AppConstant.kDefaultGap,
            KDescriptionField(controller: createNoteProvider.descCtrl),
          ],
        ),
      ),
    );
  }
}
