import 'package:bhadwadgita/screen/feature/note/create.note.dart';
import 'package:bhadwadgita/screen/feature/note/edit.note.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'bloc/note.bloc.dart';

class MainNoteScreen extends ConsumerStatefulWidget {
  const MainNoteScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainNoteScreenState();
}

class _MainNoteScreenState extends ConsumerState<MainNoteScreen> {
  @override
  Widget build(BuildContext context) {
    final noteData = ref.watch(noteStorageChangeNotifier).notesList;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes"),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Create New Note.",
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.tertiary,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CreateNoteScreen(),
            ),
          );
        },
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 16, left: 8, right: 8),
        child: GridView.builder(
            // reverse: true,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 4 / 4.2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: noteData.length,
            itemBuilder: (context, index) {
              var data = noteData[index];
              return noteItem(context, data, index);
            }),
      ),
    );
  }

  Widget noteItem(BuildContext context, data, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    EditNoteScreen(index: index, data: data)));
      },
      child: Container(
        padding: EdgeInsets.only(top: 12, left: 8, right: 8, bottom: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(11),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(data['title'].toString(),
                      maxLines: 1,
                      style: GoogleFonts.poppins(
                          fontSize: 17,
                          color: Theme.of(context)
                              .colorScheme
                              .tertiary
                              .withOpacity(0.7),
                          fontWeight: FontWeight.w500)),
                ),
                SizedBox(
                  width: 22,
                  height: 26,
                  child: PopupMenuButton<int>(
                    iconSize: 18,

                    splashRadius: 1,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    itemBuilder: (context) => [
                      // PopupMenuItem 1
                      const PopupMenuItem(
                        value: 1,
                        // row with 2 children
                        child: Row(
                          children: [
                            Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Delete")
                          ],
                        ),
                      ),
                      // PopupMenuItem 2
                    ],
                    // offset: Offset(0, 100),
                    color: Colors.grey,
                    elevation: 2,
                    // on selected we show the dialog box
                    onSelected: (value) {
                      // if value 1 show dialog
                      if (value == 1) {
                        ref.read(noteStorageChangeNotifier).deleteNote(index);
                      }
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 28.0),
              child: Text(data['content'].toString(),
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Theme.of(context)
                          .colorScheme
                          .tertiary
                          .withOpacity(0.7),
                      fontWeight: FontWeight.w500)),
            ),
          ],
        ),
      ),
    );
  }
}
