import 'package:bhadwadgita/kconstant.dart';
import 'package:bhadwadgita/screen/feature/note/bloc/note.bloc.dart';
import 'package:bhadwadgita/screen/feature/note/main.note.dart';
import 'package:bhadwadgita/utils/theme/bloc.theme.dart';
import 'package:bhadwadgita/widget/copyright.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class MainDrawer extends ConsumerStatefulWidget {
  const MainDrawer({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainDrawerState();
}

class _MainDrawerState extends ConsumerState<MainDrawer> {
  bool darkmode = false;

  @override
  Widget build(BuildContext context) {
    Color tileColor = Theme.of(context).colorScheme.secondary;
    var googleTextStyle =
        GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w500);
    return SafeArea(
      child: Drawer(
          child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 222,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xff4BC3DB), Color(0xff0C5CB3)])),
            // color: Colors.red,
            // ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: APPCONSTANT.topDownPadding * 2,

                  // alignment: Alignment.center,
                  height: 88,
                  width: 99,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://www.nicepng.com/png/detail/33-333295_everything-comes-from-krishna-that-life-comes-from.png'),
                    ),
                  ),
                  // margin: topPadding * 3,
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Bhagwad Gita",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Bhagavad-gita is manual given by the Supreme Lord Krishna which guides us in making the best use of this human life and to deriving real happiness from it.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          leading: Icon(Icons.home),
                          tileColor: tileColor,
                          title: Text("Home", style: googleTextStyle),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: Icon(Icons.favorite),
                          tileColor: tileColor,
                          title: Text(
                            "Favourite slok",
                            style: googleTextStyle,
                          ),
                          onTap: () {
                            // provider.onlineDisputeRegIndexFun(0);
                            // Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.bookmark_rounded),
                          tileColor: tileColor,
                          title: Text(
                            "Bookmark",
                            style: googleTextStyle,
                          ),
                          onTap: () {
                            // provider.onlineDisputeRegIndexFun(0);
                            // Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.notes_rounded),
                          tileColor: tileColor,
                          title: Text(
                            "Notes",
                            style: googleTextStyle,
                          ),
                          onTap: () {
                            ref.read(noteStorageChangeNotifier).readNotes();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MainNoteScreen()));
                            // provider.onlineDisputeRegIndexFun(0);
                            // Navigator.pop(context);
                          },
                        ),
                        SwitchListTile(
                          activeColor: Colors.orangeAccent,
                          value: ref.watch(darkModeProvider.notifier).state,
                          secondary: const Icon(Icons.dark_mode),
                          tileColor: tileColor,
                          title: Text("Dark mode", style: googleTextStyle),
                          onChanged: (bool val) {
                            ref.read(themeChangeNotifier).darkModetoggle(val);
                          },
                        ),
                        Container(
                          // width: MediaQuery.of(context).size.width,
                          // color: tileColor.withOpacity(0.7),
                          padding: APPCONSTANT.allPadding,
                          child: Text(
                            'APP RELATED',
                            style: googleTextStyle.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2),
                          ),
                        ),
                        ListTile(
                          leading: Icon(Icons.help),
                          tileColor: tileColor,
                          title: Text(
                            "About Us",
                            style: googleTextStyle,
                          ),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: Icon(Icons.file_copy),
                          tileColor: tileColor,
                          title: Text(
                            "Other Application",
                            style: googleTextStyle,
                          ),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: Icon(Icons.share),
                          tileColor: tileColor,
                          title: Text(
                            "Share this app",
                            style: googleTextStyle,
                          ),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: Icon(Icons.privacy_tip),
                          tileColor: tileColor,
                          title: Text(
                            "Privacy policy",
                            style: googleTextStyle,
                          ),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                  CopyrightWidget()
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
// class MainDrawer extends StatefulWidget {
//   const MainDrawer({Key? key}) : super(key: key);

//   @override
//   State<MainDrawer> createState() => _MainDrawerState();
// }

// class _MainDrawerState extends State<MainDrawer> {
//   @override
//   Widget build(BuildContext context) {
    
//   }
// }
