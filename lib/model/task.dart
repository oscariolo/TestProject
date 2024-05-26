class Task {
  int id;
  String title;
  String description;
  DateTime date;
  bool checked;
  Task({
    this.id = 0,
    this.title = 'New Title',
    this.description = 'Description',
    DateTime? date,
    this.checked = false,
  }) : date = date ?? DateTime.now();
  // Setters
  set setId(int id) {
    this.id = id;
  }

  set setTitle(String title) {
    this.title = title;
  }

  set setDescription(String description) {
    this.description = description;
  }

  set setDate(DateTime? date) {
    this.date = date ?? DateTime.now();
  }

  set setChecked(bool checked) {
    this.checked = checked;
  }

  // Getters
  int get getId {
    return id;
  }

  String get getTitle {
    return title;
  }

  String get getDescription {
    return description;
  }

  DateTime? get getDate {
    return date;
  }

  bool get getChecked {
    return checked;
  }
}
