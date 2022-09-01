import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'todoprovider.dart';
import 'todoactions.dart';
class home extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<home> {
  final _textFieldController = TextEditingController();
  String newTask = '';

  @override
  void initState() {
    super.initState();
    _textFieldController.addListener(() {
      newTask = _textFieldController.text;
    });
  }
  //disposing the controller
  @override
  void _submit() {

    final task =Provider.of<TodoProvider>(context, listen:false);
    task.addTask(newTask);
    Navigator.pop(context);
    _textFieldController.clear();
  }
  @override
  Widget build(BuildContext context) {
    Future<void> _showAddTextDialog() async {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Add a new Task"),
              content: TextField(
                autofocus: true,
                controller: _textFieldController,
                onSubmitted: (_) => _submit(),
              ),
              actions: [
                // ElevatedButton(
                //   onPressed: _submit,
                //   child: const Text("Submit"),
                //   style: ElevatedButton.styleFrom(
                //       minimumSize: const Size(120, 40)),
                // )
              ],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),

            );
          });
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("ToDo App"),
      ),
      body: Todoitems(),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          _showAddTextDialog();
        }),
        child: const Icon(Icons.add),
        tooltip: "Add a todo",
      ),
    );
  }
}