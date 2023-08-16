import 'package:bhadwadgita/kconstant.dart';
import 'package:bhadwadgita/screen/feature/bookmark/main.bookmark.dart';
import 'package:bhadwadgita/screen/feature/recent/bloc.recent.dart';
import 'package:bhadwadgita/widget/drawer/main.drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'feature/bookmark/bloc.bookmark.dart';
import 'feature/recent/recent.main.dart';
import 'gita/chapter/list.chapter.dart';

class Mainpage extends ConsumerStatefulWidget {
  const Mainpage({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainpageState();
}

class _MainpageState extends ConsumerState<Mainpage> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      initData();
    });
  }

  initData() {
    ref.read(recentChapterAndSlokChangeNotifier).readRecentChapterNote();
    ref.read(bookmarkChangeNotifier).readBookmarkrNote();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.orangeAccent,
        title: const Text("Bhagwad Gita"),
      ),
      drawer: const MainDrawer(),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: APPCONSTANT.allPadding,
              child: RecentMain(),
            ),
            // Padding(
            //   padding: APPCONSTANT.allPadding,
            //   child: PINToHome(),
            // ),
            Padding(
              padding: APPCONSTANT.topPadding,
              child: ChapterListGita(),
            ),
          ],
        ),
      ),
    );
  }
}
