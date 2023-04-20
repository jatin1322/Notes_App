import 'package:flutter/material.dart';

class AddNewNotePage extends StatefulWidget {
  const AddNewNotePage({super.key});

  @override
  State<AddNewNotePage> createState() => _AddNewNotePageState();
}

class _AddNewNotePageState extends State<AddNewNotePage> {
  FocusNode noteFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: (){},
              icon: const Icon(Icons.check),
            )
            ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                TextField(
                  autofocus: true,
                  onSubmitted: (val) {
                    if (val != "") {
                      noteFocus.requestFocus();
                    }
                  },
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: const InputDecoration(
                    hintText: "Title",
                    border: InputBorder.none,
                  ),
                ),
                Expanded(
                  child: TextField(
                    focusNode: noteFocus,
                    maxLines: null,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                    decoration: const InputDecoration(
                      hintText: "Note",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
