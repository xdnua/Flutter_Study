enum Priority { urgent, normal, low }

class Todo {
  final String text;
  final Priority priority;

  const Todo(this.text, this.priority);
}
