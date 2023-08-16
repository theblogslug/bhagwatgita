import 'package:bhadwadgita/kconstant.dart';
import 'package:bhadwadgita/screen/feature/bookmark/bloc.bookmark.dart';
import 'package:bhadwadgita/screen/feature/favorite/bloc.favorite.dart';
import 'package:bhadwadgita/utils/common_function.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

slokModalbottomsheet(
  context, {
  required WidgetRef ref,
  required int chapter,
  required int slok,
}) {
  return showModalBottomSheet<void>(
    showDragHandle: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(22), topRight: Radius.circular(22)),
    ),
    // context and builder are
    // required properties in this widget
    context: context,
    builder: (BuildContext context) {
      // we set up a container inside which
      // we create center column and display text

      // Returning SizedBox instead of a Container

      return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
        final pin = ref.watch(bookmarkChangeNotifier).bookmarkList;
        final favorite = ref.watch(favoriteChangeNotifier).favoriteList;
        return SizedBox(
          // margin: APPCONSTANT.leftRightPadding * 3,
          height: 188.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Tooltip(
                message:
                    "In each chapter, you're permitted to use just one pin.",
                child: ListTile(
                  tileColor: Colors.transparent,
                  splashColor: Theme.of(context).colorScheme.primary,
                  trailing: IconButton(
                    onPressed: () => messageAlertBox(context,
                        message:
                            "In each chapter, you're permitted to use just one pin."),
                    icon: Icon(
                      Icons.help,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  focusColor: Theme.of(context).colorScheme.primary,
                  selectedTileColor: Theme.of(context).colorScheme.primary,
                  leading: pin.contains('chapter$chapter-slok$slok')
                      ? Transform.rotate(
                          angle: 240 / 45,
                          child: const Icon(Icons.push_pin_rounded),
                        )
                      : Transform.rotate(
                          angle: 240 / 45,
                          child: const Icon(Icons.push_pin_outlined),
                        ),
                  // tileColor: Theme.of(context).colorScheme.primary,
                  title: const Text("Pin to Homepage"),
                  onTap: () {
                    setState(() {
                      if (pin.contains('chapter$chapter-slok$slok')) {
                        return ref
                            .read(bookmarkChangeNotifier)
                            .deleteNote('chapter$chapter-slok$slok');
                      }

                      ref.read(bookmarkChangeNotifier).writeBookmarkNoteUpdate(
                          chapter: chapter, slok: slok);
                    });
                  },
                ),
              ),
              ListTile(
                // favoriteChangeNotifier
                leading: favorite.contains('chapter$chapter-slok$slok')
                    ? const Icon(Icons.favorite)
                    : const Icon(Icons.favorite_outline),
                // tileColor: Theme.of(context).colorScheme.primary,
                title: const Text("Add to Favorite"),
                onTap: () {
                  setState(() {
                    if (favorite.contains('chapter$chapter-slok$slok')) {
                      ref
                          .read(favoriteChangeNotifier)
                          .deleteNote('chapter$chapter-slok$slok');
                    } else {
                      ref
                          .read(favoriteChangeNotifier)
                          .writeFavoriteNote(chapter: chapter, slok: slok);
                    }
                  });
                },
              ),
              const ListTile(
                leading: Icon(Icons.share),
                // tileColor: Theme.of(context).colorScheme.primary,
                title: Text("Share this Slok"),
              )
            ],
          ),
        );
      });
    },
  );
}

class IconWidget extends StatelessWidget {
  final IconData icons;
  final String text;
  const IconWidget({super.key, required this.icons, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 18, right: 18, bottom: 8),
          padding: APPCONSTANT.allPadding * 1.5,
          decoration: BoxDecoration(
              border: Border.all(
                  color: Theme.of(context).colorScheme.tertiary, width: 0.8),
              shape: BoxShape.circle),
          child: Icon(
            icons,
            size: 33,
            color: Theme.of(context).colorScheme.tertiary,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          text,
          style: GoogleFonts.roboto(
              fontWeight: FontWeight.w400, fontSize: 14, letterSpacing: 1.1),
        )
      ],
    );
  }
}
