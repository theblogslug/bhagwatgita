import 'package:bhadwadgita/screen/feature/bookmark/bloc.bookmark.dart';
import 'package:bhadwadgita/widget/drawer/gitachapter.drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'content/slokwidget.dart';

class GitaMain extends ConsumerStatefulWidget {
  final int initialIndex;
  final int chapterNum;
  final dynamic chapter;
  const GitaMain(
      {super.key,
      required this.chapter,
      required this.chapterNum,
      this.initialIndex = 0});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GitaMainState();
}

class _GitaMainState extends ConsumerState<GitaMain> {
  @override
  Widget build(BuildContext context) {
    final bookmark = ref.watch(bookmarkChangeNotifier).bookmarkList;
    return DefaultTabController(
      initialIndex: widget.initialIndex,
      length: widget.chapter['slokList'].length,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          // leading: Icon(Icons.person_outline),
          title: Text(
            'Chapter ${widget.chapterNum}',
          ),

          bottom: TabBar(
              isScrollable: true,
              labelColor: Theme.of(context).colorScheme.tertiary,
              unselectedLabelColor: Theme.of(context).colorScheme.secondary,
              indicatorColor: Theme.of(context).colorScheme.tertiary,
              tabs: [
                ...widget.chapter['slokList'].map((e) => Tab(
                      child: Row(
                        children: [
                          Text('Slok $e'),
                          bookmark.contains(
                                  'chapter${widget.chapterNum}-slok$e')
                              ? Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Transform.rotate(
                                    angle: 240 / 43,
                                    child: const Icon(Icons.push_pin_rounded,
                                        size: 16),
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      ),
                    )),
              ]),
        ),
        endDrawer: const GitaChapterDrawer(),
        body: TabBarView(children: [
          ...widget.chapter['slokList'].map((e) {
            return SlokWidgetScreen(
              chapterNum: widget.chapterNum,
              slokNum: e,
              slokItem: widget.chapter['chapter']['slok$e'],
            );
          })
        ]),
      ),
    );
  }
}
