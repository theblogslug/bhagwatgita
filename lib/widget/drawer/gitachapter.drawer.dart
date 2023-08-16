import 'package:bhadwadgita/kconstant.dart';
import 'package:bhadwadgita/screen/gita/kconstant.dart';

import 'package:bhadwadgita/widget/copyright.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../screen/gita/chapter/main/main.gita.dart';

class GitaChapterDrawer extends ConsumerStatefulWidget {
  const GitaChapterDrawer({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _GitaChapterDrawerState();
}

class _GitaChapterDrawerState extends ConsumerState<GitaChapterDrawer> {
  bool darkmode = false;
  int onSelect = 1;

  @override
  Widget build(BuildContext context) {
    final tileColor = Theme.of(context).colorScheme;
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
                  height: 99,
                  width: 99,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/image/cover-image.png'),
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
            child: Scrollbar(
              thumbVisibility: true, //always show scrollbar
              thickness: 3, //width of scrollbar
              radius: const Radius.circular(20), //corner radius of
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                        children: GitaKconstant.gitaChapter
                            .map(
                              (e) => ListTile(
                                leading: const Icon(Icons.notes_sharp),
                                tileColor: onSelect == e
                                    ? tileColor.secondary
                                    : tileColor.primary,
                                title: Text(
                                  "Chapter $e",
                                  style: googleTextStyle,
                                ),
                                onTap: () {
                                  onSelect = e;
                                  setState(() {});
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => GitaMain(
                                        chapterNum: e,
                                        chapter: GitaKconstant.gitavariable(e),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                            .toList()),
                  ],
                ),
              ),
            ),
          ),
          CopyrightWidget()
        ],
      )),
    );
  }
}
// class GitaChapterDrawer extends StatefulWidget {
//   const GitaChapterDrawer({Key? key}) : super(key: key);

//   @override
//   State<GitaChapterDrawer> createState() => _GitaChapterDrawerState();
// }

// class _GitaChapterDrawerState extends State<GitaChapterDrawer> {
//   @override
//   Widget build(BuildContext context) {
    
//   }
// }
