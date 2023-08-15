import 'package:bhadwadgita/kconstant.dart';
import 'package:bhadwadgita/screen/gita/chapter/main/main.gita.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Gita Chapter",
            style: GoogleFonts.sourceSansPro(
                fontWeight: FontWeight.bold, fontSize: 22),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GitaMain(),
                    ),
                  );
                },
                child: Container(
                  height: 255,
                  width: MediaQuery.of(context).size.width / 1.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              Container(
                margin: APPCONSTANT.leftRightPadding,
                height: 255,
                width: MediaQuery.of(context).size.width / 1.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
