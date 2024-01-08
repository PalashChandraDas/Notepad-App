import 'package:flutter/material.dart';
import 'package:notepad/app/modules/draft/provider/draft_provider.dart';
import 'package:provider/provider.dart';

import '../../../../utils/custom_string.dart';


class DraftView extends StatelessWidget {
  const DraftView({super.key,});

  @override
  Widget build(BuildContext context) {

    return Consumer<DraftProvider>(builder: (context, value, child) {
      return value.allDraftList.isEmpty?const Center(child: Text(CustomString.emptyNote),):
      ListView.builder(
        itemCount: value.allDraftList.length,
        itemBuilder: (context, i) {
          //store all item in note variable
          final draftNote = value.allDraftList[i];
          return ListTile(
            leading: Image.file(draftNote.image),
            title: Text(draftNote.title),
            subtitle: Text(draftNote.description),
            trailing: const Icon(Icons.query_builder),
          );
        },);
    },);
  }
}
