import 'package:bhadwadgita/screen/gita/kconstant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'content/content.dart';

class GitaMain extends ConsumerStatefulWidget {
  const GitaMain({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GitaMainState();
}

class _GitaMainState extends ConsumerState<GitaMain> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: GitaKconstant.gitaChapter1Slok.length,
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            // leading: Icon(Icons.person_outline),
            title: const Text(
              'Chapter',
            ),
            bottom: TabBar(
                isScrollable: true,
                labelColor: Theme.of(context).colorScheme.tertiary,
                unselectedLabelColor: Theme.of(context).colorScheme.secondary,
                indicatorColor: Theme.of(context).colorScheme.tertiary,
                tabs: [
                  ...GitaKconstant.gitaChapter1Slok.map((e) => Tab(
                        child: Text('Slok $e'),
                      )),
                ]),
          ),
          body: TabBarView(
              children: GitaKconstant.gitaChapter1Slok
                  .map((e) => GitaContent(
                        slok: e,
                      ))
                  .toList())),
    );
  }
}
