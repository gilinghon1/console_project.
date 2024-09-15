class Task {
  String description;
  bool completed;

  Task(this.description) : completed = false;

  void markAsComplete() {
    completed = true;
  }

  @override
  String toString() {
    return completed ? '[x] $description' : '[ ] $description';
  }
}