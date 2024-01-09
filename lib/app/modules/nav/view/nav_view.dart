import 'package:flutter/material.dart';
import 'package:notepad/app/modules/createNote/view/create_note_view.dart';
import 'package:notepad/app/modules/nav/porvider/nav_provider.dart';
import 'package:notepad/app/routes/custom_router.dart';
import 'package:notepad/utils/custom_string.dart';
import 'package:provider/provider.dart';

class NavView extends StatelessWidget {
  const NavView({super.key});

  @override
  Widget build(BuildContext context) {
    //create instance
    final navProvider = context.read<NavProvider>();

    return Scaffold(
      //floating action button position to center
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          CustomRouter.push(context: context, page: CreateNoteView());
        },
        child: const Icon(Icons.add),
      ),
      body: Consumer<NavProvider>(
        builder: (context, value, child) {
          return value.pages[navProvider.myCurrentIndex];
        },
      ),

      //BOTTOM_NAV_BAR
      bottomNavigationBar: Consumer<NavProvider>(
        builder: (context, myValue, child) {
          return BottomNavigationBar(
              currentIndex: myValue.myCurrentIndex,
              onTap: (value) => myValue.myOnTap(value),
              // unselectedItemColor: CustomColor.unselectedItemColor,
              // selectedFontSize: kWidth(context: context, value: 3),
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.note), label: CustomString.note),
                BottomNavigationBarItem(icon: Icon(Icons.drafts), label: CustomString.draft),
              ]);
        },
      ),
    );
  }
}
