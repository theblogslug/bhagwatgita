import 'package:bhadwadgita/kconstant.dart';
import 'package:bhadwadgita/screen/feature/bookmark/bloc.bookmark.dart';
import 'package:bhadwadgita/screen/feature/favorite/bloc.favorite.dart';
import 'package:bhadwadgita/screen/feature/note/bloc/note.bloc.dart';
import 'package:bhadwadgita/screen/feature/note/create.note.dart';
import 'package:bhadwadgita/screen/feature/note/edit.note.dart';
import 'package:bhadwadgita/utils/common_function.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

noteModalbottomsheet(context,
    {required WidgetRef ref, required int chapter, required int slok}) {
  return showModalBottomSheet<void>(
    useSafeArea: true,
    showDragHandle: true,
    isScrollControlled: true,
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
        List note = ref.watch(noteStorageChangeNotifier).notesList;

        int index =
            note.indexWhere((e) => e['title'] == 'chapter$chapter-slok$slok');
        if (index == -1) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              children: [
                Text(
                  "Notes",
                  style: GoogleFonts.roboto(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8,
                ),
                Divider(),
                Expanded(
                  child: Container(
                    child: CreateNoteScreen(
                      initialTitle: 'chapter$chapter-slok$slok',
                    ),
                  ),
                ),
              ],
            ),
          );
        }

        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            children: [
              Text(
                "Notes",
                style: GoogleFonts.roboto(
                    fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              Divider(),
              Expanded(
                child: Container(
                    margin: APPCONSTANT.topDownPadding * 3,
                    height: 222.0,
                    child: EditNoteScreen(
                      isShowAppBar: false,
                      data: note[index],
                      index: index,
                    )),
              ),
            ],
          ),
        );
      });
    },
  ).whenComplete(() {
    final storage = GetStorage();
    List<dynamic> note = storage.read<List<dynamic>>('notes') ?? [];

    if (note[0]['content'] == '' || note[0]['content'] == null) {
      ref.read(noteStorageChangeNotifier).deleteNote(0);
    }
  });
}
