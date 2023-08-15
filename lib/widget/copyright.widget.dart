import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class CopyrightWidget extends ConsumerWidget {
  final BoxDecoration decoration;
  final EdgeInsets padding;
  final EdgeInsets margin;
  const CopyrightWidget({
    super.key,
    this.padding = const EdgeInsets.all(8.0),
    this.margin = const EdgeInsets.all(0.0),
    this.decoration = const BoxDecoration(
        border:
            Border(top: BorderSide(color: Color.fromARGB(255, 223, 223, 223)))),
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey.shade300))),
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.copyright,
            color: Colors.grey.withOpacity(0.4),
            size: 12.0,
          ),
          Text(
            " ${DateTime.now().year}, Powered by The Blogslug.",
            style: GoogleFonts.roboto(
              color: Colors.grey.withOpacity(1),
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    );
  }
}
