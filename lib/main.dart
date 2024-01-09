import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notepad/app/modules/createNote/provider/create_note_provider.dart';
import 'package:notepad/app/modules/draft/provider/draft_provider.dart';
import 'package:notepad/app/modules/nav/porvider/nav_provider.dart';
import 'package:notepad/theme/app_theme.dart';
import 'package:notepad/utils/app_constant.dart';
import 'package:notepad/utils/custom_string.dart';
import 'package:provider/provider.dart';

import 'app/modules/nav/view/nav_view.dart';
import 'app/modules/note/provider/note_provider.dart';


void main() {

  runApp(
    MultiProvider(
      providers: [

        ChangeNotifierProvider(create: (context) => NavProvider(),),
        ChangeNotifierProvider(create: (context) => NoteProvider(),),
        ChangeNotifierProvider(create: (context) => CreateNoteProvider(),),
        ChangeNotifierProvider(create: (context) => DraftProvider(),),

      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of this application.
  @override
  Widget build(BuildContext context) {
    //dynamic height and width
    double w = AppConstant.kWidth(context: context);
    double h = AppConstant.kWidth(context: context);
    return ScreenUtilInit(
      designSize: Size(w,h),
      builder: (_, child) => MaterialApp(
        title: CustomString.appName,
        theme: AppTheme.themeData,
        home: const NavView(),
      ),
    );
  }
}
