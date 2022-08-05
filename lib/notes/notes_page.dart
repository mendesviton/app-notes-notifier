import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spp_notes_notifier/notes/notes_model.dart';
import 'package:spp_notes_notifier/notes/notes_notifier.dart';

final notesProvides =
    StateNotifierProvider<NotesNotifier, List<NotesModel>>((Ref) {
  return NotesNotifier();
});

class NotesPage extends HookConsumerWidget {
  NotesPage({Key? key}) : super(key: key);

  final noteController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notes = ref.watch(notesProvides);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref
              .read(notesProvides.notifier)
              .addNote(NotesModel(title: noteController.text));
          noteController.clear();
        },
        child: const Icon(Icons.save),
      ),
      appBar: AppBar(backgroundColor: Colors.blueGrey),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextFormField(
              controller: noteController,
              decoration:
                  const InputDecoration(hintText: 'Escreva seu insight'),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: notes.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      trailing: IconButton(
                        icon: Icon(
                          Icons.delete,
                        ),
                        onPressed: () {
                          ref
                              .read(notesProvides.notifier)
                              .removeNote(notes[index]);
                        },
                      ),
                      title: Text(notes[index].title,
                          style: TextStyle(color: Colors.black)),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
