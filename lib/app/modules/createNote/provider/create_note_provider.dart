import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:notepad/app/routes/custom_router.dart';
import 'package:notepad/utils/custom_string.dart';


class CreateNoteProvider extends ChangeNotifier {
  TextEditingController titleCtrl = TextEditingController();
  TextEditingController descCtrl = TextEditingController();
  File? uploadedImg;
  final picker = ImagePicker();
  bool isUploaded = false;

  clearTextController() {
    titleCtrl.clear();
    descCtrl.clear();
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


}
