import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/notes_model.dart';
import '../repository/controller.dart';

class AddNoteScreen extends StatelessWidget {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  AddNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                final String title = _titleController.text;
                final String description = _descriptionController.text;
                if (title.isNotEmpty && description.isNotEmpty) {
                  final Note note = Note(
                    id: DateTime.now().millisecondsSinceEpoch.toString(),
                    title: title,
                    description: description,
                    isTrashed: false,
                  );
                  Get.find<NotesController>()
                      .addNote(note); // Use GetX controller
                  Navigator.pop(context);
                } else {
                  // Show error message
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please fill in all fields')),
                  );
                }
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
