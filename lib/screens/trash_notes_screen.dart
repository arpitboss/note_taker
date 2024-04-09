import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../repository/controller.dart';

class TrashNotesScreen extends StatelessWidget {
  const TrashNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trash Notes'),
      ),
      body: GetBuilder<NotesController>(
        init: NotesController(),
        builder: (controller) {
          final trashNotes = controller.trashNotes;
          if (trashNotes.isEmpty) {
            return const Center(
              child: Text('Trash is empty !!'),
            );
          } else {
            return ListView.builder(
              itemCount: trashNotes.length,
              itemBuilder: (context, index) {
                final note = trashNotes[index];
                return ListTile(
                  title: Text(note.title),
                  subtitle: Text(note.description),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.restore),
                        onPressed: () {
                          controller.restoreNoteFromTrash(note);
                          Get.back();
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.delete_forever,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          controller.deleteNotePermanently(note);
                          Get.back();
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
