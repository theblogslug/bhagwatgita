import 'package:bhadwadgita/screen/feature/note/bloc/note.bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';

class CreateNoteScreen extends ConsumerStatefulWidget {
  const CreateNoteScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateNoteScreenState();
}

class _CreateNoteScreenState extends ConsumerState<CreateNoteScreen> {
  final titleController = TextEditingController();
  final notesController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    initdata();
  }

  initdata() {
    final storage = GetStorage();
    List<dynamic> note = storage.read<List<dynamic>>('notes') ?? [];
    note.insert(0, {"title": "Untitled Text", "content": ""});
    storage.write('notes', note);
  }

  handleSubmit() {
    if (titleController.text.isEmpty) {
      titleController.text = "Untitled Text";
    }
    if (formKey.currentState!.validate()) {
      var res = {
        "title": titleController.text,
        "content": notesController.text
      };

      ref.read(noteStorageChangeNotifier).addNote(res);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (titleController.text.isEmpty && notesController.text.isEmpty) {
          ref.read(noteStorageChangeNotifier).deleteNote(0);
        }
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Form(
        key: formKey,
        child: Scaffold(
          appBar: AppBar(
            title: TextFormField(
              cursorColor: Theme.of(context).colorScheme.tertiary,
              controller: titleController,
              textInputAction: TextInputAction.newline,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onChanged: (val) => handleSubmit(),
              textCapitalization: TextCapitalization.sentences,
              keyboardType: TextInputType.multiline,
              style: Theme.of(context).textTheme.headline1?.copyWith(
                    fontSize: 19,
                    color: Theme.of(context).colorScheme.tertiary,
                    fontWeight: FontWeight.w500,
                  ),
              decoration: InputDecoration(
                fillColor: Colors.transparent,
                filled: true,
                hintText: 'Title', //.snakeCasetoSentenceCase(),
                border: InputBorder.none,

                hintStyle: Theme.of(context).textTheme.headline1?.copyWith(
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context)
                          .colorScheme
                          .tertiary
                          .withOpacity(0.5),
                    ),
              ),
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: TextFormField(
                  autofocus: true,
                  cursorColor: Theme.of(context).colorScheme.tertiary,
                  // textAlign: TextAlign.center,
                  controller: notesController,
                  textInputAction: TextInputAction.newline,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (val) => handleSubmit(),
                  maxLines: 33,
                  textCapitalization: TextCapitalization.sentences,
                  keyboardType: TextInputType.multiline,
                  style: Theme.of(context).textTheme.headline1?.copyWith(
                        fontSize: 15,
                        color: Theme.of(context).colorScheme.tertiary,
                        fontWeight: FontWeight.w400,
                      ),
                  decoration: InputDecoration(
                    fillColor: Colors.transparent,
                    filled: true,
                    // hintText: 'Notes', //.snakeCasetoSentenceCase(),
                    // border: InputBorder.none,

                    hintStyle: Theme.of(context).textTheme.headline1?.copyWith(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                  ),
                  validator: (value) {
                    if (value == '') {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
