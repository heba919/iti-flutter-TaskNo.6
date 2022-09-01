class TodoModel {
  String todoTitle;
  bool check;
  TodoModel({ this.todoTitle, this.check = false});
// to toggle the task
  void toggleCompleted() {
    check = !check;
  }
}