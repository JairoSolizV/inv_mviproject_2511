class FocusItem {
  final String id;
  final String title;
  final bool isCompleted;

  FocusItem({
    required this.id,
    required this.title,
    this.isCompleted = false,
  });

  FocusItem copyWith({
    String? id,
    String? title,
    bool? isCompleted,
  }) {
    return FocusItem(
      id: id ?? this.id,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
