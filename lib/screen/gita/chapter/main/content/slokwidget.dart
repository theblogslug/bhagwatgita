import 'package:bhadwadgita/kconstant.dart';
import 'package:bhadwadgita/screen/feature/bookmark/bloc.bookmark.dart';
import 'package:bhadwadgita/screen/feature/favorite/bloc.favorite.dart';
import 'package:bhadwadgita/screen/feature/recent/bloc.recent.dart';
import 'package:bhadwadgita/widget/bottomsheet/note.bottomsheetmodal_widget.dart';
import 'package:bhadwadgita/widget/bottomsheet/slok.bottomsheetmodal_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class SlokWidgetScreen extends ConsumerStatefulWidget {
  final int chapterNum;
  final int slokNum;
  final Map<String, dynamic> slokItem;
  const SlokWidgetScreen(
      {super.key,
      required this.slokItem,
      required this.chapterNum,
      required this.slokNum});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SlokWidgetScreenState();
}

class _SlokWidgetScreenState extends ConsumerState<SlokWidgetScreen> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      initData();
    });
  }

  initData() async {
    ref.read(bookmarkChangeNotifier).readBookmarkrNote();
    ref.read(recentChapterAndSlokChangeNotifier).writeRecentChapterNote(
        chapter: widget.chapterNum,
        slok: widget.slokNum,
        et: widget.slokItem['siva']['et'],
        ht: widget.slokItem['tej']['ht']);
    ref.read(bookmarkChangeNotifier).readBookmarkrNote();
  }

  @override
  Widget build(BuildContext context) {
    // final bookmark = ref.watch(bookmarkChangeNotifier).bookmarkList;
    final favorite = ref.watch(favoriteChangeNotifier).favoriteList;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        tooltip: "Write Note",
        onPressed: () {
          noteModalbottomsheet(context,
              ref: ref, chapter: widget.chapterNum, slok: widget.slokNum);
        },
        child: Icon(
          Icons.edit,
          color: Theme.of(context).colorScheme.tertiary,
        ),
      ),
      body: Container(
        padding: APPCONSTANT.allPadding,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                          left: 8, right: 16, top: 8, bottom: 8),
                      height: 51,
                      width: 51,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image:
                                  AssetImage('assets/image/cover-image.png'))),
                    ),
                    Text(
                      'Bhagwat Gita',
                      style: GoogleFonts.sourceSansPro(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                Row(
                  children: [
                    // bookmark.contains(
                    //         'chapter${widget.chapterNum}-slok${widget.slokNum}')
                    //     ? Transform.rotate(
                    //         angle: 240 / 45,
                    //         child: const Icon(Icons.push_pin_rounded, size: 16),
                    //       )
                    //     : const SizedBox(),
                    favorite.contains(
                            'chapter${widget.chapterNum}-slok${widget.slokNum}')
                        ? Padding(
                            padding: APPCONSTANT.leftPadanding / 2,
                            child: const Icon(
                              Icons.favorite,
                              size: 17,
                            ),
                          )
                        : const SizedBox(),
                    IconButton(
                        onPressed: () {
                          slokModalbottomsheet(
                            context,
                            ref: ref,
                            chapter: widget.chapterNum,
                            slok: widget.slokNum,
                          );
                        },
                        icon: Icon(Icons.more_vert)),
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.slokItem['siva']['et'],
                // textAlign: TextAlign.center,
                style: GoogleFonts.sourceSansPro(
                    fontSize: 16, height: 1.4, letterSpacing: 0.9),
              ),
            ),
            // Text(
            //   slokItem['san']['et'],
            //   // textAlign: TextAlign.center,
            //   style: GoogleFonts.sourceSansPro(fontSize: 18),
            // ),
          ],
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final int value;
  final IconData icons;
  final String text;
  const MenuItem(
      {super.key,
      required this.icons,
      required this.text,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icons,
          color: Theme.of(context).colorScheme.tertiary,
        ),
        const SizedBox(width: 10),
        Text(text)
      ],
    );
  }
}
