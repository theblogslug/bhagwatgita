import 'dart:developer';

import 'package:bhadwadgita/widget/field/textfield.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  bool isLoading = false;
  final databaseRef = FirebaseDatabase.instance.ref('post');
  final controller = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("data"),
      ),
      body: Column(
        children: [
          CustomTextField(
            // initialValue: "hello",
            textEditingController: controller,
            hint: "hint",
            isRequired: true,
          ),
          GestureDetector(
            onTap: () async {
              databaseRef.child('Movies').set(controller.text).then((value) {
                log("message success");
                return Fluttertoast.showToast(msg: "sucessfully created ")
                    .onError((error, stackTrace) {
                  log("message error");
                  return Fluttertoast.showToast(
                      msg: "error $error ", backgroundColor: Colors.red);
                });
              });

              // GoogleSignIn().currentUser != null
              //     ? await GoogleSignIn().signIn()
              //     : "";
              // final data = await GoogleSignIn().signIn();
              // final value = await data?.authentication;

              // await databaseRef
              //     .child('test3')
              //     .set({"title": controller.text}).then((value) {
              //   return Fluttertoast.showToast(msg: "sucessfully created ")
              //       .onError((error, stackTrace) {
              //     return Fluttertoast.showToast(
              //         msg: "error $error ", backgroundColor: Colors.red);
              //   });
              // });
              log("message ");
            },
            child: Container(
              height: 48,
              width: MediaQuery.of(context).size.width - 88,
              color: Colors.amber,
              child: const Center(child: Text("Submit")),
            ),
          )
        ],
      ),
    );
  }
}
