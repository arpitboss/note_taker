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
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                    title: const Text("Confirm"),
                                    content: const Text(
                                        "Are you sure you want to restore this note?"),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: const Text("Cancel"),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          controller.restoreNoteFromTrash(note);
                                          Get.back();
                                          Get.back();
                                        },
                                        child: const Text("Restore"),
                                      ),
                                    ]);
                              });
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.delete_forever,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                    title: const Text("Confirm"),
                                    content: const Text(
                                        "Are you sure you want to permanently delete this note?"),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: const Text("Cancel"),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          controller
                                              .deleteNotePermanently(note);
                                          Get.back();
                                          Get.back();
                                        },
                                        child: const Text(
                                          "Delete Permanently",
                                          style: TextStyle(color: Colors.red),
                                        ),
                                      ),
                                    ]);
                              });
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
