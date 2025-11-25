import '../data/focus_model.dart';

class FocusState {
  final bool isLoading;
  final FocusItem? currentFocus;
  final List<FocusItem> history;
  final String? error;

  FocusState({
    this.isLoading = false,
    this.currentFocus,
    this.history = const [],
    this.error,
  });

  FocusState copyWith({
    bool? isLoading,
    FocusItem? currentFocus,
    List<FocusItem>? history,
    String? error,
  }) {
    return FocusState(
      isLoading: isLoading ?? this.isLoading,
      currentFocus: currentFocus ?? this.currentFocus,
      history: history ?? this.history,
      error: error ?? this.error,
    );
  }
}
