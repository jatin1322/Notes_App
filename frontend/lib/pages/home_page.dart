import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/pages/add_new_note.dart';
import 'package:notes_app/providers/notes_provider.dart';
import 'package:provider/provider.dart';
import 'package:notes_app/models/note.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    NotesProvider notesProvider = Provider.of<NotesProvider>(context);
    //This would build this function when we change list of notes
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes App By Jatin"),
        centerTitle: true,
      ),
      body:  (notesProvider.isLoading==false)? SafeArea(
          child: (notesProvider.notes.isNotEmpty )?  GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: notesProvider.notes.length,
        itemBuilder: (context, index) {
          Note currentNote = notesProvider.notes[index];
          return GestureDetector(
            onTap: () {
              //update
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) =>AddNewNotePage(isUpdate: true ,note: currentNote),
                ),
              );
            },
            onLongPress: () {
              // delete
              notesProvider.deleteNote(currentNote);
            },
            child: Container(
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey, width: 2)),
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    currentNote.title!,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Text(
                    currentNote.content!,
                    style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 5,
                  ),
                ],
              ),
            ),
          );
        },
      ): const Center(
        child: Text("No Notes Yet"),
      ),
      
      ): Center(
        child: CircularProgressIndicator(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            CupertinoPageRoute(
                fullscreenDialog: true,
                builder: (context) => const AddNewNotePage(isUpdate: false,)),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
