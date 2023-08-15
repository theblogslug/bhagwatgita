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
        Container(
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
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Chapter 4 | Slok 8",
                        style: GoogleFonts.sourceSansPro(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text(
                          "।।4.18।। जो पुरुष कर्म में अकर्म और अकर्म में कर्म देखता है,  वह मनुष्यों में बुद्धिमान है,  वह योगी सम्पूर्ण कर्मों को करने वाला है।।",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: GoogleFonts.sourceSansPro(
                              fontWeight: FontWeight.w300, fontSize: 13),
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
      ],
    );
  }
}
