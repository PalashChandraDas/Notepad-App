import 'package:flutter/material.dart';
import 'package:notepad/app/modules/note/view/note_view.dart';

import '../../draft/view/draft_view.dart';

class NavProvider extends ChangeNotifier {
  //screen list for bottom nav
  final List<Widget> pages = [NoteView(), const DraftView()];

  //current index of bottom navigation bar
  int myCurrentIndex = 0;

  //tapped method for bottom navigation
  void myOnTap(int i) {
    myCurrentIndex = i;
    notifyListeners();
  }
}
