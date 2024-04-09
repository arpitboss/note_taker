import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_taker/widgets/trash_notes_card.dart';

import '../repository/controller.dart';
import 'add_notes_screen.dart';
import 'notes_description_screen.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notesController = Get.put(NotesController());

    return Scaffold(
      backgroundColor: Colors.grey[50],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurpleAccent[100],
        onPressed: () {
          Get.to(AddNoteScreen());
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 180,
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20, 90, 20, 20),
            decoration: BoxDecoration(
              color: Colors.deepPurpleAccent[100],
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Row(
              children: [
                const Icon(
                  CupertinoIcons.news,
                  color: Colors.white,
                  size: 32,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'Notes',
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    _showBottomSheet(context);
                  },
                  icon: const Icon(Icons.arrow_drop_down),
                )
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              final notes = notesController.notes;
              if (notes.isEmpty) {
                return const Center(child: Text('Add some notes !!'));
              } else {
                return ListView.builder(
                  itemCount: notes.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                        title: Text(
                          notes[index].title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          notes[index].description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        onTap: () {
                          Get.to(NoteDetailsScreen(note: notes[index]));
                        },
                      ),
                    );
                  },
                );
              }
            }),
          ),
        ],
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.2,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [TrashNotesCard()],
          ),
        );
      },
    );
  }
}
