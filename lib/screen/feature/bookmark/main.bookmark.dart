import 'package:bhadwadgita/kconstant.dart';
import 'package:bhadwadgita/screen/gita/kconstant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class PINToHome extends ConsumerStatefulWidget {
  const PINToHome({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PINToHomeState();
}

class _PINToHomeState extends ConsumerState<PINToHome> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Pinned",
            style: GoogleFonts.sourceSansPro(
                fontWeight: FontWeight.bold, fontSize: 22),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...GitaKconstant.gitaChapter.map(
                (e) => Container(
                  padding: APPCONSTANT.allPadding * 1.5,
                  margin: APPCONSTANT.leftRightPadding,
                  height: 99,
                  width: MediaQuery.of(context).size.width / 2.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Chapter $e",
                            style: GoogleFonts.sourceSansPro(
                                fontSize: 19, fontWeight: FontWeight.w600),
                          ),
                          Padding(
                            padding: APPCONSTANT.topPadding / 2,
                            child: Text(
                              "Slok 1",
                              style: GoogleFonts.sourceSansPro(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                      Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            "Continue...",
                            style: GoogleFonts.roboto(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context)
                                    .colorScheme
                                    .tertiary
                                    .withOpacity(0.7)),
                          ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
