import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spp_notes_notifier/notes/notes_model.dart';

class NotesNotifier extends StateNotifier<List<NotesModel>> {
  NotesNotifier() : super([]);

  void addNote(NotesModel note) {
    state = [...state, note];
  }

  void removeNote(NotesModel note) {
    state = state.where((noteOfList) => noteOfList != note).toList();
  }
}
