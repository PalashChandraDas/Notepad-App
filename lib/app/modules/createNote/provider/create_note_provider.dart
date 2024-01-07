import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:notepad/app/modules/draft/provider/draft_provider.dart';
import 'package:notepad/app/routes/custom_router.dart';
import 'package:notepad/utils/custom_string.dart';
import 'package:provider/provider.dart';

import '../../nav/view/nav_view.dart';


class CreateNoteProvider extends ChangeNotifier {
  TextEditingController titleCtrl = TextEditingController();
  TextEditingController descCtrl = TextEditingController();
  File? uploadedImg;
  final picker = ImagePicker();
  bool isUploaded = false;

  clearAllValue() {
    titleCtrl.clear();
    descCtrl.clear();
    deleteImage();
  }

//Image Picker function to get image from gallery
  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      uploadedImg = File(pickedFile.path);
      isUploaded = true;
      notifyListeners();
    }
  }

  //Image Picker function to get image from camera
  Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      uploadedImg = File(pickedFile.path);
      isUploaded = true;
      notifyListeners();
    }
  }

  //image from gallery and camera
  Future showOptions({required BuildContext context}) async {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            child: const Text(CustomString.gallery),
            onPressed: () {
              // close the options modal
              CustomRouter.pop(context: context);
              // get image from gallery
              getImageFromGallery();
            },
          ),
          CupertinoActionSheetAction(
            child: const Text(CustomString.camera),
            onPressed: () {
              // close the options modal
              CustomRouter.pop(context: context);
              // get image from camera
              getImageFromCamera();
            },
          ),
        ],
      ),
    );
  }

  //Image Picker function to get image from gallery
  deleteImage() {
    uploadedImg = null;
    isUploaded = false;
    notifyListeners();
  }

  //APP EXIT DIALOG
  Future<bool> onBackButtonPressed({required BuildContext context}) async {
    bool exitApp = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Save draft?'),
          actions: [
            TextButton(
                onPressed: () {
                  CustomRouter.pushReplacement(context: context, page: NavView());
                  clearAllValue();
                },
                child: const Text('No')),
            TextButton(
                onPressed: () {
                  context.read<DraftProvider>().addDraftFunc(context: context);
                  CustomRouter.pushReplacement(context: context, page: NavView());
                  clearAllValue();
                },

                child: const Text('Yes')),

          ],
        );
      },
    );

    return exitApp;
  }

}
