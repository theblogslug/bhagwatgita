import 'dart:developer';

import 'package:bhadwadgita/kconstant.dart';
import 'package:bhadwadgita/utils/baseclient.dart';
import 'package:dio/dio.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

class GitaContent extends ConsumerStatefulWidget {
  final int slok;
  const GitaContent({super.key, required this.slok});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GitaContentState();
}

class _GitaContentState extends ConsumerState<GitaContent> {
  int chapter = 18;
  final databaseRef = FirebaseDatabase.instance.ref('post');

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () async {
            Response res =
                await BaseClient().request('$chapter/${widget.slok}');
            var result = res.data;
            log("message ${res.runtimeType}");

            await databaseRef
                .child('chapter$chapter')
                .child("slok${widget.slok}")
                .set(result)
                .then((value) {
              log("message success");
              return Fluttertoast.showToast(msg: "sucessfully saved ")
                  .onError((error, stackTrace) {
                log("message error");
                return Fluttertoast.showToast(
                    msg: "error $error ", backgroundColor: Colors.red);
              });
            });
          },
          child: Container(
            margin: APPCONSTANT.topPadding * 4,
            color: Colors.grey,
            padding: APPCONSTANT.allPadding,
            child: Text("Chapter $chapter, slok${widget.slok}"),
          ),
        )
      ],
    );
  }
}
