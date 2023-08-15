import 'package:bhadwadgita/kconstant.dart';
import 'package:bhadwadgita/screen/feature/bookmark/main.bookmark.dart';
import 'package:bhadwadgita/widget/drawer/main.drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'feature/recent/recent.main.dart';
import 'gita/chapter/list.chapter.dart';

class Mainpage extends ConsumerStatefulWidget {
  const Mainpage({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainpageState();
}

class _MainpageState extends ConsumerState<Mainpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.orangeAccent,
        title: const Text("Bhagwad Gita"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.note_add),
      ),
      drawer: const MainDrawer(),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: APPCONSTANT.topPadding * 0,
              child: const RecentMain(),
            ),
            Padding(
              padding: APPCONSTANT.topPadding,
              child: ChapterListGita(),
            ),
            Padding(
              padding: APPCONSTANT.topPadding,
              child: MainBookmark(),
            ),
          ],
        ),
      ),
    );
  }
}
