import 'package:bhadwadgita/screen/feature/recent/bloc.recent.dart';
import 'package:bhadwadgita/screen/gita/chapter/main/main.gita.dart';
import 'package:bhadwadgita/screen/gita/kconstant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class RecentMain extends ConsumerStatefulWidget {
  const RecentMain({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RecentMainState();
}

class _RecentMainState extends ConsumerState<RecentMain> {
  @override
  Widget build(BuildContext context) {
    final res = ref.watch(recentChapterAndSlokChangeNotifier).recent;
    if (res.isEmpty) {
      return const SizedBox();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Recent",
            style: GoogleFonts.sourceSansPro(
                fontWeight: FontWeight.bold, fontSize: 22),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GitaMain(
                    initialIndex: res['slok'] - 1,
                    chapter: GitaKconstant.gitavariable(res['chapter']),
                    chapterNum: res['chapter']),
              ),
            );
          },
          child: Container(
            // padding: APPCONSTANT.allPadding,
            height: 99,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11),
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Chapter ${res['chapter']} | Slok ${res['slok']}",
                          style: GoogleFonts.sourceSansPro(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 8.0),
                          child: Text(
                            "${res['ht']}",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: GoogleFonts.sourceSansPro(
                                fontWeight: FontWeight.w300,
                                fontSize: 13,
                                color: Theme.of(context).colorScheme.tertiary),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(11),
                          bottomRight: Radius.circular(11))),
                  width: 66,
                  child: Center(
                      child: Text(
                    "Read",
                    style: GoogleFonts.sourceSansPro(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  )),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
