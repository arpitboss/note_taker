import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/notes_model.dart';
import '../repository/controller.dart';

class NoteDetailsScreen extends StatefulWidget {
  final Note note;

  const NoteDetailsScreen({super.key, required this.note});

  @override
  _NoteDetailsScreenState createState() => _NoteDetailsScreenState();
}

class _NoteDetailsScreenState extends State<NoteDetailsScreen> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.note.title);
    _descriptionController =
        TextEditingController(text: widget.note.description);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Note Details'),
        actions: [
          IconButton(
            icon: _isEditing ? const Icon(Icons.save) : const Icon(Icons.edit),
            onPressed: () {
              setState(() {
                _isEditing = !_isEditing;
              });
              if (_isEditing) {
                FocusScope.of(context).requestFocus(FocusNode());
              } else {
                _saveChanges();
                Get.back();
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Confirm"),
                    content: const Text(
                        "Are you sure you want to delete this note?"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.find<NotesController>()
                              .moveNoteToTrash(widget.note);
                          Navigator.pop(context);
                          Get.back();
                        },
                        child: const Text("Delete"),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _isEditing
                  ? TextField(
                      controller: _titleController,
                      decoration: const InputDecoration(
                        labelText: 'Title',
                        border: OutlineInputBorder(),
                      ),
                    )
                  : Text(
                      widget.note.title,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
              const SizedBox(height: 16),
              _isEditing
                  ? TextField(
                      controller: _descriptionController,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      decoration: const InputDecoration(
                        labelText: 'Description',
                        border: OutlineInputBorder(),
                      ),
                    )
                  : Text(
                      widget.note.description,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  void _saveChanges() {
    final updatedNote = Note(
      id: widget.note.id,
      title: _titleController.text,
      description: _descriptionController.text,
      isTrashed: false,
    );
    Get.find<NotesController>().editNote(updatedNote);
  }
}
