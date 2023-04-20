import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:notes_app/providers/notes_provider.dart';

import 'package:notes_app/pages/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NotesProvider(),
        )
      ],
      child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
    );
     
  }
}
