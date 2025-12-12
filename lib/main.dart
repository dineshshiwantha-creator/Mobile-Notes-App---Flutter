import 'package:flutter/material.dart';

void main() => runApp(
  const MaterialApp(home: NotesApp(), debugShowCheckedModeBanner: false),
);

class NotesApp extends StatefulWidget {
  const NotesApp({super.key});
  @override
  State<NotesApp> createState() => _NotesAppState();
}

class _NotesAppState extends State<NotesApp> {
  final notes = <String>[], c = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Simple Notes'),
      backgroundColor: Colors.deepPurple,
      centerTitle: true,
    ),
    backgroundColor: const Color(0xFFF3F0FF),
    body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: c,
                  decoration: const InputDecoration(
                    hintText: 'Write a note...',
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.add, color: Colors.deepPurple),
                onPressed: () {
                  if (c.text.isNotEmpty) setState(() => notes.add(c.text));
                  c.clear();
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: notes.length,
            itemBuilder: (_, i) => Card(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: ListTile(title: Text(notes[i])),
            ),
          ),
        ),
      ],
    ),
  );
}
