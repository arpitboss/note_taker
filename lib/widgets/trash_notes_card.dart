import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/trash_notes_screen.dart';

class TrashNotesCard extends StatelessWidget {
  const TrashNotesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        title: const Row(
          children: [
            Icon(
              CupertinoIcons.delete,
              size: 18,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              'Trash Notes',
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
          ],
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.grey[400],
        ),
        onTap: () {
          Get.back();
          Get.to(() => const TrashNotesScreen());
        },
      ),
    );
  }
}
