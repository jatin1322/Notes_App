import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/pages/add_new_note.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes App By Jatin"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(5),
            color: Colors.blue,
          );
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            CupertinoPageRoute(
              fullscreenDialog: true,
              builder: (context) => const AddNewNotePage()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
