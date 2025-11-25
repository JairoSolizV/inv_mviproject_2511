import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';
import '../data/focus_model.dart';
import 'focus_intent.dart';
import 'focus_state.dart';

class FocusController {
  final ValueNotifier<FocusState> state = ValueNotifier(FocusState());
  final _uuid = const Uuid();

  void dispatch(FocusIntent intent) {
    if (intent is LoadFocus) {
      _loadFocus();
    } else if (intent is AddFocus) {
      _addFocus(intent.title);
    } else if (intent is CompleteFocus) {
      _completeFocus(intent.id);
    } else if (intent is ClearFocus) {
      _clearFocus();
    }
  }

  void _loadFocus() {
    // Simulate loading from storage
    state.value = state.value.copyWith(isLoading: true);
    Future.delayed(const Duration(milliseconds: 500), () {
      state.value = state.value.copyWith(isLoading: false);
    });
  }

  void _addFocus(String title) {
    if (title.trim().isEmpty) return;
    final newFocus = FocusItem(id: _uuid.v4(), title: title);
    state.value = state.value.copyWith(currentFocus: newFocus);
  }

  void _completeFocus(String id) {
    final current = state.value.currentFocus;
    if (current != null && current.id == id) {
      final completed = current.copyWith(isCompleted: true);
      final newHistory = List<FocusItem>.from(state.value.history)..insert(0, completed);
      // We set currentFocus to null explicitly by passing a new FocusState with null currentFocus if we wanted,
      // but copyWith doesn't support setting null easily if we check for null.
      // So we construct a new state.
      state.value = FocusState(
        isLoading: state.value.isLoading,
        currentFocus: null,
        history: newHistory,
        error: state.value.error,
      );
    }
  }

  void _clearFocus() {
     state.value = FocusState(
        isLoading: state.value.isLoading,
        currentFocus: null,
        history: state.value.history,
        error: state.value.error,
      );
  }
}
