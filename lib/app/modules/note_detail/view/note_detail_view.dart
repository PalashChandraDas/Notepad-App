import 'package:flutter/material.dart';
import 'package:notepad/app/modules/note_detail/widgets/k_heading.dart';
import 'package:notepad/utils/app_constant.dart';
import 'package:notepad/utils/custom_string.dart';

import '../../note/model/note_model.dart';

class NoteDetail extends StatefulWidget {
  const NoteDetail({super.key, required this.note});
  final NoteModel note;

  @override
  State<NoteDetail> createState() => _NoteDetailState();
}

class _NoteDetailState extends State<NoteDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(CustomString.detailAppTitle),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              child: Image.file(widget.note.image),
            ),
            AppConstant.kDefaultGap,
            KHeading(title: CustomString.detailTitle),
            Text(widget.note.title),
            AppConstant.kDefaultGap,
            KHeading(title: CustomString.detailDesc),
            Text(widget.note.description),
          ],
        ),
      ),
    );
  }
}
