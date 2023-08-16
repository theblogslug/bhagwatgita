import 'dart:developer';

import 'package:bhadwadgita/kconstant.dart';
import 'package:bhadwadgita/screen/feature/bookmark/bloc.bookmark.dart';
import 'package:bhadwadgita/screen/gita/chapter/main/main.gita.dart';
import 'package:bhadwadgita/screen/gita/kconstant.dart';
import 'package:bhadwadgita/utils/common_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class ChapterListGita extends ConsumerStatefulWidget {
  const ChapterListGita({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ChapterListGitaState();
}

class _ChapterListGitaState extends ConsumerState<ChapterListGita> {
  @override
  Widget build(BuildContext context) {
    final pin = ref.watch(bookmarkChangeNotifier).bookmarkList;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 16, bottom: 8),
          child: Text(
            "Gita Chapter",
            style: GoogleFonts.sourceSansPro(
                fontWeight: FontWeight.bold, fontSize: 22),
          ),
        ),
        Column(
          children: [
            ...GitaKconstant.gitaChapter.map((e) => Padding(
                  padding: const EdgeInsets.only(top: 1.0),
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(22)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(22),
                      child: ListTile(
                        leading: Icon(Icons.label_important),
                        trailing: chapterContainsPin(ref, chapter: e)
                            ? Transform.rotate(
                                angle: 240 / 45,
                                child: const Icon(Icons.push_pin_rounded,
                                    size: 16),
                              )
                            : const SizedBox(),
                        tileColor: Theme.of(context).colorScheme.primary,
                        title: Text(
                          "Chapter $e",
                          style:
                              GoogleFonts.roboto(fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text(
                            GitaKconstant.chapterTitle[e]!['hi'].toString()),
                        onTap: () {
                          var isContainsChapter =
                              returnPinValue(ref, chapter: e);
                          if (isContainsChapter != null) {
                            log("message $isContainsChapter");

                            var res = separateString(isContainsChapter);

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => GitaMain(
                                        initialIndex:
                                            int.parse(res['slok'].toString()) -
                                                1,
                                        chapter: GitaKconstant.gitavariable(e),
                                        chapterNum: e)));
                            return;
                          }
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GitaMain(
                                      // initialIndex: res['slok'] - 1,
                                      chapter: GitaKconstant.gitavariable(e),
                                      chapterNum: e)));
                        },
                      ),
                    ),
                  ),
                ))
          ],
        )
      ],
    );
  }
}
