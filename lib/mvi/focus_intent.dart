abstract class FocusIntent {}

class LoadFocus extends FocusIntent {}

class AddFocus extends FocusIntent {
  final String title;
  AddFocus(this.title);
}

class CompleteFocus extends FocusIntent {
  final String id;
  CompleteFocus(this.id);
}

class ClearFocus extends FocusIntent {}
