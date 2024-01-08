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
import '../../note/provider/note_provider.dart';
import '../provider/create_note_provider.dart';

class CreateNoteView extends StatelessWidget {
  const CreateNoteView({super.key});
  @override
  Widget build(BuildContext context) {
    //declare instance
    final createNoteProvider = context.read<CreateNoteProvider>();
    final noteProvider = context.read<NoteProvider>();

    return WillPopScope(
      onWillPop: () async {
       return createNoteProvider.onBackButtonPressed(context: context);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(CustomString.createNoteTitle),
          actions: [
            SaveButton(
              onPressed: () {
                noteProvider.addNoteFunc(context: context);
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
      ),
    );
  }
}
