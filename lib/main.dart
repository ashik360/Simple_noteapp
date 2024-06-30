import 'package:flutter/material.dart';

void main() {
  runApp(MyNotesApp());
}

class MyNotesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Notes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: NotesScreen(),
    );
  }
}

class NotesScreen extends StatefulWidget {
  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  List<String> notes = [];

  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Notes'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns in the grid
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Center(
                      child: Text(
                        notes[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      hintText: 'Enter your note...',
                    ),
                    onSubmitted: (value) {
                      _addNote();
                    },
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    _addNote();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _addNote() {
    String newNote = _textEditingController.text.trim();
    if (newNote.isNotEmpty) {
      setState(() {
        notes.add(newNote);
      });
      _textEditingController.clear();
    }
  }
}
