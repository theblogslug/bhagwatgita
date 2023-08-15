import 'package:bhadwadgita/screen/feature/note/bloc/note.bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditNoteScreen extends ConsumerStatefulWidget {
  final int index;
  final Map<String, dynamic> data;
  const EditNoteScreen({super.key, required this.index, required this.data});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends ConsumerState<EditNoteScreen> {
  late TextEditingController titleController = TextEditingController();
  late TextEditingController notesController = TextEditingController();
  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.data['title']);
    notesController = TextEditingController(text: widget.data['content']);
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
      // If the form is valid, display a Snackbar.
      ref.read(noteStorageChangeNotifier).editNote(widget.index, res);
    }
  }

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        appBar: AppBar(
          title: TextFormField(
            // initialValue: widget.data['title'],
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
                    color:
                        Theme.of(context).colorScheme.tertiary.withOpacity(0.5),
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
        body: Column(
          children: [
            Expanded(
              child: TextFormField(
                autofocus: true,
                cursorColor: Theme.of(context).colorScheme.tertiary,
                // textAlign: TextAlign.center,
                controller: notesController,
                maxLines: 33,
                textInputAction: TextInputAction.newline,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onChanged: (val) => handleSubmit(),
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
    );
  }
}
